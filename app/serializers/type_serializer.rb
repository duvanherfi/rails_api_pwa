class TypeSerializer < ActiveModel::Serializer
  attributes :_id, :name
  belongs_to :type

  def _id
    object.id.to_s
  end
end
