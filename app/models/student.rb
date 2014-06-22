class Student < ActiveRecord::Base
  has_many :studentassignments
  has_many :teachers
  belongs_to :user
end
