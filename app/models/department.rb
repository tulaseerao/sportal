class Department < ActiveRecord::Base
  has_many :courses
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
