# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, inverse_of: 'author', class_name: 'Test'
  
  def test_level(test_level)
    self.tests.where(level: test_level)
  end
end
