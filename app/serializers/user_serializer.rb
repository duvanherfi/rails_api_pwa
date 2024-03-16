class UserSerializer < ActiveModel::Serializer
  attributes :_id, :name, :email, :phone, :identification, :created_at, :updated_at, :session_token
  belongs_to :position

  def _id
    object.id.to_s
  end
end
