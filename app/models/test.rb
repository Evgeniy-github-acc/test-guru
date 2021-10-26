class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy 
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, foreign_key: "user_id", class_name: 'User', optional: true

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  scope :level_sort, -> (level) { where(level: level) }
  scope :easy, -> { level_sort(0..1) }
  scope :medium, -> { level_sort(2..4) }
  scope :hard, -> { level_sort(5..Float::INFINITY) }


  scope :tests_by_category_title, -> (category_title) { joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.title = ?', category_title) }
  
  scope :user_succeed_tests, -> (user_id) { joins('JOIN test_passages ON test_passages.test_id = tests.id')
                                              .where('test_passages.user_id = ?', user_id)
                                              .where('test_passages.succeed = true') }
  
  scope :category, -> (category_id) { where(category: category_id) }
  
  def self.sorted_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
