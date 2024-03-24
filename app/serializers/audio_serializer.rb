class AudioSerializer < ActiveModel::Serializer
  attributes :_id, :file
  belongs_to :task

  def _id
    object.id.to_s
  end
end
