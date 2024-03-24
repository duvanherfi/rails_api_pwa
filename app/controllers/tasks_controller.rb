class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  def index
    @tasks = @project.tasks.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = @project.tasks.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  def avatar
    content = @task.avatar.read
    if stale?(etag: content, last_modified: @task.updated_at.utc, public: true)
      send_data content, type: @task.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :completed, :add_task_dialog)
    end
end
