class ClientSerializer < ActiveModel::Serializer
  attributes :_id, :name, :email, :phone, :identification, :created_at, :updated_at
  belongs_to :type

  def _id
    object.id.to_s
  end
end
