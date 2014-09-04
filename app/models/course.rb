class Course < ActiveRecord::Base
  belongs_to :department
  belongs_to :grade
  has_many :current_courses
  has_many :current_students, :through => :current_courses, :source => :user
  has_many :current_teachers, :through => :current_courses, :source => :user
  
  validates :name, presence: true
  validates_uniqueness_of :name
end
