class UserType < ActiveRecord::Base
  has_many :users
  
  def self.admin
  	find_by_name('Admin')
  end
  
  def self.student
  	find_by_name('Student')
  end
  
  def self.teacher
  	find_by_name('Teacher')
  end
end
