class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, foreign_key: "user_id", class_name: 'User'

  def self.sorted_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').
    where('categories.title = ?', category).order("tests.created_at DESC").
    pluck(:title)
  end
end
