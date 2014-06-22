class Studentassignments < ActiveRecord::Base
    has_many :students
    has_many :assignments
end
