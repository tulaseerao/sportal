class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # The courses already takentaken
  has_many :taken_courses
  has_many :t_courses, through: :taken_courses, :source => :course, :include => :department

  # The courses  recommended
  has_many :recommended_courses
  has_many :r_courses, through: :recommended_courses, :source => :course

  # The currently chosen courses
  has_many :current_courses
  has_many :c_courses, through: :current_courses, :source => :course
	
  # The courses appealed for
  has_many :appeal_courses
  has_many :a_courses, through: :appeal_courses, :source => :course
  	
  # This is the school grade the user will be in
  belongs_to :current_grade, :class_name => "Grade"
  belongs_to :next_grade, :class_name => "Grade"
  belongs_to :user_type
  
  # Validations ----------------------------------------------------------------
  validates_uniqueness_of :email
  
  def name
  	self.full_name.blank? ? "#{self.first_name} #{self.last_name}" : self.full_name
  end
  
  def possessive_name
  	self.preferred_name.blank? ? "#{self.name}'s" : "#{self.preferred_name}'s"
  end
  
  def is_admin?
  	self.user_type == UserType.admin rescue false
  end
  
  def is_student?
  	self.user_type == UserType.student rescue false
  end
  
  def is_teacher?
  	self.user_type == UserType.teacher rescue false
  end
  
  def self.students
  	where :user_type_id => UserType.student.id
  end
  
  def self.teachers
  	where :user_type_id => UserType.teacher.id
  end

  def self.admins
    where :user_type_id => UserType.admin.id
  end
end
