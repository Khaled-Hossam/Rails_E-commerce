class AddUserisActiveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isActive, :string, :default => 'true'

  end
end
