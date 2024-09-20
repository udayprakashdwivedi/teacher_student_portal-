class Student < ApplicationRecord
  belongs_to :teacher

  validates :name, :subject, :marks, presence: true
  validates :marks, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
