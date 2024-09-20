class Teacher < ApplicationRecord
  has_secure_password
  has_many :students

  validates :email, presence: true, uniqueness: true
end
