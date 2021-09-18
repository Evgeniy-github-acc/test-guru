class Test < ApplicationRecord
  belongs_to :category, optional: true
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, foreign_key: "user_id", class_name: 'User', optional: true

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  scope :level_sort, -> (level) { where(level: level) }
  scope :easy, -> { level_sort(0..1) }
  scope :medium, -> { level_sort(2..4) }
  scope :hard, -> { level_sort(5..Float::INFINITY) }

  scope :tests_by_category, -> (category) { joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.title = ?', category) }
  
  def self.sorted_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
