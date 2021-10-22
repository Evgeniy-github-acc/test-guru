class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :first_name
      t.string :last_name
      t.string :type, null: false, default: 'User'
      t.timestamps
    end
  add_index :users, :email, unique: true
  add_index :users, :type  
  end
end