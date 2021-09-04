class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :enroll]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    if current_user.teacher_role 
      @course = Course.new
    else
      redirect_to root_path, alert: 'You are not authorized to add a course!.' 
    end
    
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if current_user.teacher_role 
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to @course, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: 'Not authorized to perform that action :( .' 
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if current_user.teacher_role 
      @course.destroy
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, alert: 'Not authorized to perform that action :( .' 
    end
  end
  
  def enroll
    @enroll = @course.enrollments.new(:user_id => current_user.id)
    if @enroll.save
      redirect_to root_path , notice: 'Enrollment Successfull!!.'
    else
      redirect_to root_path, alert: 'Failed to enroll  :(';
    end    
  end

  def manage_tutor
    set_course
    
  end

  def assign_tutor
    set_course
    # @tutor = Tutor.new(:course_id=>@course.id, :user_id=>current_user.id)
    # if @tutor.save
    #   req = Request.where(:course_id=>@course.id, :user_id=>current_user.id)
    #   req.destroy 
    #   redirect_to manage_tutor_course_path , notice: 'Tutor added successfully.'
    # else
    #   redirect_to manage_tutor_course_path, alert: 'Failed to enroll  :(';
    # end 
  end

  #controller function to apply to become a tutor.
  def apply_for_tutor
    set_course
  end

  def remove_tutor
    set_course
  end

  def remove_request
    set_course
    # req = Request.find(params[:req_id])
    # req.destroy
    # redirect_to manage_tutor_course_path , notice: 'Request denied !!.'

  end

  def communicate
    set_course
    session[:conversations] ||= []
    @users = Array.new
    #getting tutors userr object
    @tutors = @course.tutors
    @tutors.each do |tut|
      @users.push(tut.user)
    end

    if @users.include? current_user 
      @users.delete(current_user)
        
    end    
    
    #@users = User.all.where.not(id: current_user)
    #@users = @course.tutors.user.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :user_id)
    end
end
