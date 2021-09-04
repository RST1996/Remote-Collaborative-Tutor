class ContentsController < ApplicationController
	before_action :set_course
  
  def index
	@content = @course.contents
  end

  def create
	@content = @course.contents.new(content_params)
	 respond_to do |format|
      if @content.save
        format.html { redirect_to course_path(@course.id), notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
	 @content = @course.contents.new
  end

  def edit
    @content = @course.contents.find(params[:id])
  end

  def show
  end

  def update
    @content = Content.find(params[:id])
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to course_path(@course.id), notice: 'Content was successfully updated.' }
        format.json { render :index, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content = @course.contents.find(params[:id])
    @content.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course.id), notice: 'Content was successfully removed.' }
      format.json { head :no_content }
    end
  end
  
  private
	def set_course
      @course = Course.find(params[:course_id])
    end
	
	def content_params
      params.require(:content).permit(:name, :attachment, :content_type, :size)
    end
end
