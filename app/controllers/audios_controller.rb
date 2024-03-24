class AudiosController < ApplicationController
  before_action :set_project
  before_action :set_task
  before_action :set_audio, only: %i[ show update destroy file]

  def index
    @audios = @task.audios.all

    render json: @audios
  end

  def show
    render json: @audio
  end

  def create
    @audio = @task.audios.new(audio_params)

    if @audio.save
      render json: @audio, status: :created
    else
      render json: @audio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @audio.update(audio_params)
      render json: @audio
    else
      render json: @audio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @audio.destroy!
  end

  def file
    content = @audio.file.read
    if stale?(etag: content, last_modified: @audio.updated_at.utc, public: true)
      send_data content, type: @audio.file.file.content_type, disposition: "inline"
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

    def set_audio
      @audio = @task.audios.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audio_params
      params.require(:audio).permit(:file)
    end
end
