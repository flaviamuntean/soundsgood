class AddDistanceFromUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :distance_from_user, :float
  end
end
