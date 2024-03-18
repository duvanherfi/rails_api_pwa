class Person
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :phone, type: String
  field :identification, type: String

  #validar que no exista registros con el mismo email e identificación
  validates :email, uniqueness: true
  validates :identification, uniqueness: true
end
