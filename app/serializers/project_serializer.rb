class ProjectSerializer < ActiveModel::Serializer
  attributes :_id, :name
  has_many :tasks

  def _id
    object.id.to_s
  end
end
