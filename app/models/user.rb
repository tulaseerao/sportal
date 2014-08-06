class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # This is where we create the courses taken
  has_many :taken_courses
  has_many :t_courses, through: :taken_courses, :source => :course

  # This is where we create the courses that are being recommended
  has_many :recommended_courses
  has_many :r_courses, through: :recommended_courses, :source => :course

  # This is where we create the courses that are being recommended
  has_many :current_courses
  has_many :c_courses, through: :current_courses, :source => :course
	
  # This is the school grade the user will be in
  belongs_to :current_grade, :class_name => "Grade"
  belongs_to :next_grade, :class_name => "Grade"
  belongs_to :user_type
  
  # Validations ----------------------------------------------------------------
  validates_uniqueness_of :email
  
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
end
