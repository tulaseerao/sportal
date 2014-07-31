require 'config_scripts/config_script'
require 'seeds/loader'
require 'csv'

# rails r db/seeds/already_taken.rb up
class AlreadyTaken < ConfigScript
  def columns
	[:"Export ID", :"Student Full Name", :"Student Preferred Name", :"Student Current Grade", :"Full Name (1) - Online CR Academic History classes- US", :"Course ID (1) - Online CR Academic History classes- US", :"Full Name (2) - Online CR Academic History classes- US", :"Course ID (2) - Online CR Academic History classes- US", :"Full Name (3) - Online CR Academic History classes- US", :"Course ID (3) - Online CR Academic History classes- US", :"Full Name (4) - Online CR Academic History classes- US", :"Course ID (4) - Online CR Academic History classes- US", :"Full Name (5) - Online CR Academic History classes- US", :"Course ID (5) - Online CR Academic History classes- US", :"Full Name (6) - Online CR Academic History classes- US", :"Course ID (6) - Online CR Academic History classes- US", :"Full Name (7) - Online CR Academic History classes- US", :"Course ID (7) - Online CR Academic History classes- US", :"Full Name (8) - Online CR Academic History classes- US", :"Course ID (8) - Online CR Academic History classes- US", :"Full Name (9) - Online CR Academic History classes- US", :"Course ID (9) - Online CR Academic History classes- US", :"Full Name (10) - Online CR Academic History classes- US", :"Course ID (10) - Online CR Academic History classes- US", :"Full Name (11) - Online CR Academic History classes- US", :"Course ID (11) - Online CR Academic History classes- US", :"Full Name (12) - Online CR Academic History classes- US", :"Course ID (12) - Online CR Academic History classes- US", :"Full Name (13) - Online CR Academic History classes- US", :"Course ID (13) - Online CR Academic History classes- US", :"Full Name (14) - Online CR Academic History classes- US", :"Course ID (14) - Online CR Academic History classes- US", :"Full Name (15) - Online CR Academic History classes- US", :"Course ID (15) - Online CR Academic History classes- US", :"Full Name (16) - Online CR Academic History classes- US", :"Course ID (16) - Online CR Academic History classes- US", :"Full Name (17) - Online CR Academic History classes- US", :"Course ID (17) - Online CR Academic History classes- US", :"Full Name (18) - Online CR Academic History classes- US", :"Course ID (18) - Online CR Academic History classes- US", :"Full Name (19) - Online CR Academic History classes- US", :"Course ID (19) - Online CR Academic History classes- US", :"Full Name (1) - Online CR current classes", :"Course ID (1) - Online CR current classes", :"Full Name (2) - Online CR current classes", :"Course ID (2) - Online CR current classes", :"Full Name (3) - Online CR current classes", :"Course ID (3) - Online CR current classes", :"Full Name (4) - Online CR current classes", :"Course ID (4) - Online CR current classes", :"Full Name (5) - Online CR current classes", :"Course ID (5) - Online CR current classes", :"Full Name (6) - Online CR current classes", :"Course ID (6) - Online CR current classes", :"Full Name (7) - Online CR current classes", :"Course ID (7) - Online CR current classes", :"Full Name (8) - Online CR current classes", :"Course ID (8) - Online CR current classes", :"Full Name (9) - Online CR current classes", :"Course ID (9) - Online CR current classes", :"Full Name (10) - Online CR current classes", :"Course ID (10) - Online CR current classes", :"Full Name (11) - Online CR current classes", :"Course ID (11) - Online CR current classes", :"Full Name (12) - Online CR current classes", :"Course ID (12) - Online CR current classes", :"Full Name (13) - Online CR current classes", :"Course ID (13) - Online CR current classes", :"Full Name (14) - Online CR current classes", :"Course ID (14) - Online CR current classes", :"Full Name (15) - Online CR current classes", :"Course ID (15) - Online CR current classes", :"\"Full Name (1) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (1) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (2) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (2) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (3) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (3) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (4) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (4) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (5) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (5) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (6) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (6) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (7) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (7) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (8) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (8) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (9) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (9) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (10) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (10) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (11) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (11) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (12) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (12) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (13) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (13) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (14) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (14) - Online CR - Math", :" Lang academic history in MS\"", :"\"Full Name (15) - Online CR - Math", :" Lang academic history in MS\"", :"\"Course ID (15) - Online CR - Math", :" Lang academic history in MS\"", :"Full Name (1) - Online CR - Band and Choir in MS", :"Course ID (1) - Online CR - Band and Choir in MS", :"Full Name (2) - Online CR - Band and Choir in MS", :"Course ID (2) - Online CR - Band and Choir in MS", :"Full Name (3) - Online CR - Band and Choir in MS", :"Course ID (3) - Online CR - Band and Choir in MS", :"Full Name (4) - Online CR - Band and Choir in MS", :"Course ID (4) - Online CR - Band and Choir in MS", :"Full Name (5) - Online CR - Band and Choir in MS", :"Course ID (5) - Online CR - Band and Choir in MS", :"Full Name (6) - Online CR - Band and Choir in MS", :"Course ID (6) - Online CR - Band and Choir in MS", :"Full Name (7) - Online CR - Band and Choir in MS", :"Course ID (7) - Online CR - Band and Choir in MS", :"Full Name (8) - Online CR - Band and Choir in MS", :"Course ID (8) - Online CR - Band and Choir in MS"] 
  end
  
  def cources_already_taken
    File.read(File.join(Rails.root, 'db', 'seeds/courses_already_taken.csv'))
  end
  
  def parsed
    CSV.parse(self.cources_already_taken).map do |line|
      Hash[self.columns.each_with_index.map{|column,index| [column,line[index].to_s.strip]}]
    end
  end
  
	def find_or_create_user(line)
		user = User.find_by_export_id(line[:"Export ID"])
		unless user
			user = User.create(
			  :export_id => line[:"Export ID"],
			  :first_name => line[:"Student Preferred Name"],
			  :full_name => line[:"Student Full Name"],
			  :preferred_name => line[:"Student Preferred Name"],
			  :last_name => line[:"Student Full Name"].split(' ').last,
			  :current_grade_id => Grade.find_or_create_by_name(line[:"Student Current Grade"]).id,
			  :user_type_id => UserType.student.id,
			  :email => "#{line[:'Export ID']}@sportal.com",
			  :password => 'Password01'
			   
			)
		else
			user.update_attributes(
			  :export_id => line[:"Export ID"],
			  :first_name => line[:"Student Preferred Name"],
			  :full_name => line[:"Student Full Name"],
			  :preferred_name => line[:"Student Preferred Name"],
			  :last_name => line[:"Student Full Name"].split(' ').last,
			  :current_grade_id => Grade.find_or_create_by_name(line[:"Student Current Grade"]).id,
			  :user_type_id => UserType.student.id 
			)
		end
		user
	end
		
	def find_or_create_courses(line)
		courses = {}
		for i in 1..19
		  	c = Course.find_by_code(line[:"Course ID (#{i}) - Online CR Academic History classes- US"])
		  	if c.blank?
		  	    c = Course.create(
		  	      :name => line[:"Full Name (#{i}) - Online CR Academic History classes- US"],
		  	      :code => line[:"Course ID (#{i}) - Online CR Academic History classes- US"],
		  	      :description => line[:"Full Name (#{i}) - Online CR Academic History classes- US"]
		  	      ) unless line[:"Course ID (#{i}) - Online CR Academic History classes- US"].blank? && line[:"Full Name (#{i}) - Online CR Academic History classes- US"].blank?
		  	end
		  	courses[i] = c
		end
		courses
	end
    
  def courses_taken_from_line(line)
    user = find_or_create_user(line)   
    courses = find_or_create_courses(line)
    taken_count = 0
    courses_taken = []
    for c in courses	
   		tc = TakenCourse.find_by_course_id_and_user_id(c[1].id, user.id) rescue nil
	    unless tc.blank?
	    	#puts "#{tc.inspect} Already exists."
	    	taken_count += 0
	    else
	    	tc = TakenCourse.create(:user_id => user.id, :course_id => c[1].id) unless c[1].blank? || user.blank?
	    	
	    	taken_count +=  1 unless tc.blank?
	    	
	    end
	    courses_taken << tc
	end
	[taken_count, courses_taken]
  end

   def bring_up
     puts "Processing course taken courses.....Start #{TakenCourse.all.size} taken courses in total"
     c = 0
     self.parsed.each do |line|
       next if(line[:"Export ID"] == "Export ID" || line["Export ID"] == "Export ID")
       c += self.courses_taken_from_line(line)[0]
     end
     puts "Completed... created #{c} new courses taken !!! Now #{TakenCourse.all.size} courses taken in total"
     
   end

  def bring_down
    puts "Processing undo for courses taken..... #{TakenCourse.all.size} courses taken in total"
    c = 0
    self.parsed.each do |line|
      next if(line[:label] == 'label' || line['label'] == 'label')
      courses_taken = courses_taken_from_line(line)[1] 
      begin
          c = courses_taken.size 
          courses_taken.destroy_all unless c == 0
      rescue 
      	puts "Unable to destroy:- #{c} courses taken"
      end
    end
    puts "Successfully destroyed #{c} courses taken!!!"
  end
  
end

AlreadyTaken.new

