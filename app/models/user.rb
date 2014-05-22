class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # This is where we create the courses taken
  has_many :courses_takens
  has_many :courses, through: :courses_takens

  # This is where we create the courses that are being recommended
  has_many :recommended_courses
  has_many :courses, through: :recommended_courses

  # This is the school grade the user will be in
  belongs_to :grade
end
