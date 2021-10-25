class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :rule
      t.integer :rule_param
      t.string :file

      t.timestamps
    end
  end
end
