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
    
    # The course that is being created.
    # @return [Course]
    expose(:course)
    
    # The taken_courses that is being created.
    # @return [Relation<Course>]
    expose(:taken_courses) { user.t_courses }
    
    # The recommended_courses that is being created.
    # @return [Relation<Course>]
    expose(:recommended_courses) { user.r_courses - current_courses }
    
    # The current_courses that is being created.
    # @return [Relation<Course>]
    expose(:current_courses) { user.c_courses }
    
    # The current_courses that is being created.
    # @return [Relation<Course>]
    expose(:grade_courses) { next_grade.courses.order(:name).uniq }
        
    # @!attribute user_from_email
    # The user who has the email.
    # @return [User]
    expose(:user_from_email) { User.find_by_email(params[:email]) }
    
  def index
     user.is_admin? ? (redirect_to :admin) : ''
  end

  def stud_data
  	render json: User.all.to_json
  end

  def dept_data
    render json: departments.select([:id,:name,:description]).to_json
  end
  
  def rec_course_data
  	render json: recommended_courses.map{|rc| {'id' => rc.id, 'title' => rc.name, 'drag' => true}}.flatten.to_json
  end
  
  def curr_course_data
  	render json: current_courses.map{|cc| {'id' => cc.id, 'title' => cc.name, 'drag' => true}}.flatten.to_json
  end
  
  def dept_grade_courses_data
    puts params.inspect
    dept = Department.find_by_name(params[:dept])
    (grade_courses & dept.courses).map{|cc| {'id' => cc.id, 'title' => cc.name}}.to_json
  end
  
  def store_course
  	puts params.inspect
    course
    puts course.inspect
    # c = courses.find_by_id(params[:id])
    user.c_courses << course unless user.c_courses.include?(course)
    puts current_courses.inspect
    puts user.c_courses.inspect
  	render json: current_courses{|sc| {'id' => sc.id, 'title' => sc.name, 'drag' => true}}.flatten.to_json
  end
end
