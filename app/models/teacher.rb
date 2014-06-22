class Teacher < ActiveRecord::Base
  has_many :assignments
  has_many :students
  belongs_to :user
end
