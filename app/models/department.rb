class Department < ActiveRecord::Base
  has_many :courses
  
  validates :name, presence: true
  validates_uniqueness_of :name
end
