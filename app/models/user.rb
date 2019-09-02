class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:spotify]

  # validates :email, :password, :first_name, :last_name, presence: true

  # has_many :videos, dependent: :destroy
  # has_many :audios, dependent: :destroy
end
