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
    
    # All departments.
    # @return [Department]
    expose(:departments){ Department.all.order(:name).uniq }
    
    # All courses.
    # @return [Course]
    expose(:courses)
    
    # The course that is being worked on.
    # @return [Course]
    expose(:course)
    
    # The taken_courses for current user.
    # @return [Relation<Course>]
    expose(:taken_courses) { user.t_courses.group_by{|c| c.department.name rescue 'Others'}.sort } #params[:dept_id] ? user.t_courses.where(:department_id => params[:dept_id]) : user.t_courses.where(:department_id => departments.first.id) }
    
    # The recommended_courses for current user.
    # @return [Relation<Course>]
    expose(:recommended_courses) { (user.r_courses - current_courses_arr).group_by{|c| c.department.name rescue 'Others'} }
    
    # The appeal_courses of current user.
    # @return [Relation<Course>]
    expose(:appeal_courses) { (user.a_courses - current_courses_arr).group_by{|c| c.department.name rescue 'Others'} }
    
    # The current_courses selected by current user.
    # @return [Relation<Course>]
    expose(:current_courses_arr) { user.c_courses }
    
    # The current_courses selected by current user.
    # @return [Relation<Course>]
    expose(:current_courses) { current_courses_arr.group_by{|c| c.department.name rescue 'Others'} }
    
    # The current_courses that is being created.
    # @return [Relation<Course>]
    expose(:grade_courses) { next_grade.courses.order(:name).uniq.group_by{|c| c.department.name rescue 'Others'} }
        
    # @!attribute user_from_email
    # The user who has the email.
    # @return [User]
    expose(:user_from_email) { User.find_by_email(params[:email]) }
    
  def index
     user.is_admin? ? (redirect_to :admin) : ''
  end
  
  def summary
  end
  
  def electives
    render :text => "This is the electives page. Under construction."
  end

  def stud_data
  	render json: User.all.to_json
  end

  def dept_data
    taken_courses
    render json: departments.select([:id,:name,:description]).to_json
  end
  
  def rec_course_data
  	render json: recommended_courses.to_json #.map{|rc| {'id' => rc.id, 'title' => rc.name, 'drag' => true}}.flatten.to_json
  end
  
  def curr_course_data
  	render json: current_courses.to_json #.map{|cc| {'id' => cc.id, 'title' => cc.name, 'drag' => true}}.flatten.to_json
  end
  
  def dept_grade_courses_data
    puts ">>>>>>>>>>> This is the dept_grade_courses_data and params = #{params.inspect}"
    puts params.inspect
    dept = Department.find_by_name(params[:dept])
    (grade_courses & dept.courses).map{|cc| {'id' => cc.id, 'title' => cc.name}}.to_json
  end
  
#  def get_courses
#  	dept_id = params[:dept_id].to_i || departments.first.id
#  	puts ">>>>>>>> inside get_courses and params = #{params.inspect} and dept_id = #{dept_id}"
#  	taken_courses = user.t_courses.where(:department_id => dept_id)
#  	puts "taken_courses = #{taken_courses.inspect}"
#  	respond_to do |format|
#  	  format.js
#  	end
#  	
#  end
  
  def store_course
  	puts params.inspect
    student_courses = courses.find_all_by_id(params[:id].split(','))
    student_courses.each do |course|
    	user.c_courses << course unless user.c_courses.include?(course)
    end
    puts current_courses.inspect
    puts user.c_courses.inspect
  	render json: current_courses{|sc| {'id' => sc.id, 'title' => sc.name, 'drag' => true}}.flatten.to_json
  end
end
