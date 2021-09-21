class RemoveLoginFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :login, :string
  end
end
