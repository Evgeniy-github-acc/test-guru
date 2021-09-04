class Test < ApplicationRecord
  def self.sorted_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).select(:title).order("tests.created_at DESC")
  end
end
