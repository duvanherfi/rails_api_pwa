class TaskSerializer < ActiveModel::Serializer
  attributes :_id, :name, :description, :completed, :add_task_dialog
  has_many :images
  has_many :audios

  def _id
    object.id.to_s
  end
end
