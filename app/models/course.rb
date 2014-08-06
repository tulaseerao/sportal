class Course < ActiveRecord::Base
  belongs_to :department
  belongs_to :grade
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
