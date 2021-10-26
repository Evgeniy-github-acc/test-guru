class AddSucceedToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :succeed, :boolean, default: false
  end
end
