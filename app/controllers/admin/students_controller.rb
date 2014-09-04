class Admin::StudentsController < Admin::BaseAdminController
  before_action :set_student, only: [:update]
    
  # !group Exposures
  	  
    # The current student.
    # return [User]
    expose(:student){ students.find_by_id(params[:id]) }
    
  # GET /students
  # GET /students.json
  def index
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = User.students.new(student_params)
    @student.password = 'Password01'
    respond_to do |format|
      if @student.save
        format.html { redirect_to admin_students_path, notice: 'student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to admin_student_path(@student), notice: 'student was successfully updated.' }
        format.json { render action: 'show', status: :updated, location: @student }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    student.destroy
    respond_to do |format|
      format.html { redirect_to admin_students_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = User.students.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:user).permit(:export_id, :first_name, :last_name, :preferred_name, :email, :current_grade_id, :next_grade_id, :active, :can_update)
    end
end
