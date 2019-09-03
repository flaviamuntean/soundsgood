class AddIconToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :icon, :string
  end
end
