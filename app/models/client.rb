class Client < Person
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :type, optional: true
end

