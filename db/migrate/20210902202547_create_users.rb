class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
