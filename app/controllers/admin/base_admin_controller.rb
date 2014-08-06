class Admin::BaseAdminController < ApplicationController

  layout "admin"
  
  helper AdminHelper
  before_action :authenticate_user!
  before_action :is_admin?
  
  # @!group Exposures
  	  
    # The current user.
    # @return [User]
    expose(:user){current_user}
    
    # The user_type of current_user
    # @return [User]
    expose(:user_type){user.user_type}
    
    # All departments.
    # @return [Department]
    expose(:departments){ Department.all.order(:name).uniq }
    
    # All courses
    # @return [Course]
    expose(:courses){ Course.all.order(:name).uniq }
    
    # All grades
    # @return [Grade]
    expose(:grades)
    
    # All users
    # @return [User]
    expose(:users)
    
    # All students
    # @return [User]
    expose(:students){ User.students }
    
    
#    def 
#    
#    private
    
    def is_admin?
    	!user.is_admin? ? (redirect_to :root) : '' 
    end
  
end
