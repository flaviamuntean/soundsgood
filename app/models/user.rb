require 'open-uri'
class User < ApplicationRecord
  include PgSearch::Model
  mount_uploader :avatar, PhotoUploader
  mount_uploader :banner, PhotoUploader

  serialize :top_tracks, Array
  serialize :top_artists, Array

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #after_update :soundcloud_profile_load
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:spotify, :facebook]

  # validates :email, :password, :first_name, :last_name, presence: true
  has_many :user_instruments, dependent: :destroy
  has_many :instruments, through: :user_instruments
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :favorited, source_type: 'User'
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy

  has_many :notifications, foreign_key: :recipient_id

  # method for favorites
  def likes?(user)
    favorite_users.any? { |u| u.id == user.id }
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # after_sign_out :geocode, if: :will_save_change_to_address?

  multisearchable against: [:first_name, :last_name, :bio]

  pg_search_scope :global_search,
    against: [:first_name, :last_name, :bio],
    associated_against: {
      instruments: [:name],
      genres: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def full_name
    first_name + " " + last_name
  end

  def soundcloud_profile_load
    if self.soundcloud_profile.present?
      # run method
      url = 'https://api.soundcloud.com/resolve.json?url=' + self.soundcloud_profile + '/tracks&client_id=UW9ajvMgVdMMW3cdeBi8lPfN6dvOVGji'
      tracks = JSON.load(open(url))
      songs = {}
      tracks.each do |track|
        songs[track["title"]] = track["id"]
      end
      songs.sort_by { |key| key }.to_h
    end
  end
end
