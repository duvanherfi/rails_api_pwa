class User  < Person
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :position, optional: true
end
