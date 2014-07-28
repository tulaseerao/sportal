class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  # @!group Exposures
  	  
    # The user that is being created or modified.
    # @return [User]
    expose(:user){current_user}
    
    # The user that is being created or modified.
    # @return [User]
    expose(:user_type){user.user_type}
    
    # The current grade of current user.
    # @return [Grade]
    expose(:current_grade){ user.current_grade }
    
    # The next grade of current user.
    # @return [Grade]
    expose(:next_grade){ user.next_grade }
    
    # The departments that is being created.
    # @return [Department]
    expose(:departments){ Department.all.order(:name).uniq }
    
    # The courses that is being created.
    # @return [Course]
    expose(:courses)
    
    # The taken_courses that is being created.
    # @return [Relation<Course>]
    expose(:taken_courses) { user.t_courses }
    
    # The taken_courses that is being created.
    # @return [Relation<Course>]
    expose(:recommended_courses) { user.r_courses }
    
        
    # @!attribute user_from_email
    # The user who has the email.
    # @return [User]
    expose(:user_from_email) { User.find_by_email(params[:email]) }
    
  def index
  end

  def stud_data
  	render json: User.all.to_json
  end

  def dept_data
    render json: departments.select([:id,:name,:description]).to_json
  end
  
  def rec_course_data
  	render json: recommended_courses.select([:id,:name]).to_json
  end
end
