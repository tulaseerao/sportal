class Admin::CoursesController < Admin::BaseAdminController
  before_action :set_course, only: [:update, :destroy]
  require 'will_paginate/array'

  # !group Exposures
      
  # The current course.
  # return [User]
  expose(:course)
    
  # GET /courses
  # GET /courses.json
  def index
  end
  
  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to admin_courses_path, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to admin_courses_path, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    course.destroy
    respond_to do |format|
      format.html { redirect_to admin_courses_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :code, :grade_id, :department_id, :errors)
    end
end