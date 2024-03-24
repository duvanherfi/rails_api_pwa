class ImagesController < ApplicationController
  before_action :set_project
  before_action :set_task
  before_action :set_image, only: %i[ show update destroy file]

  def index
    @images = @task.images.all

    render json: @images
  end

  def show
    render json: @image
  end

  def create
    byebug
    @image = @task.images.new(image_params)

    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @image.destroy!
  end

  def file
    content = @image.file.read
    if stale?(etag: content, last_modified: @image.updated_at.utc, public: true)
      send_data content, type: @image.file.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:task_id])
    end

    def set_image
      @image = @task.images.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:file)
    end
end
