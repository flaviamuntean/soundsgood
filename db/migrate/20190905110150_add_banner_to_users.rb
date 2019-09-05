class AddBannerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :banner, :string
  end
end
