class Test < ApplicationRecord
  def self.tests_by(category)
    Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category).order('id DESC')
  end
end
