class AudioSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :_id, :url
  belongs_to :task

  def _id
    object.id.to_s
  end

  def url
    file_project_task_audio_path(object.task.project, object.task, object)
  end
end
