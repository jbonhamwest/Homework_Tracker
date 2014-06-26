class Studentassignment < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  has_many :comments

  def update(params)
    self.status = "completed"
    super
  end
end
