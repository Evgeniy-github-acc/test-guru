# frozen_string_literal: true

class User < ApplicationRecord
  def test_level(test_level)
    Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').
    where('user_tests.user_id = ? AND tests.level = ?', id.to_s, test_level)
  end
end
