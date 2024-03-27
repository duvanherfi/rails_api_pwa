class ProjectSerializer < ActiveModel::Serializer
  attributes :_id, :name, :tasks

  def tasks
    ActiveModelSerializers::SerializableResource.new(
      object.tasks,
      each_serializer: TaskSerializer
    ).as_json
  end

  def _id
    object.id.to_s
  end
end
