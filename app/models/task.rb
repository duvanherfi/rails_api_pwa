class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :completed, type: Mongoid::Boolean, default: false
  field :add_task_dialog, type: Mongoid::Boolean, default: false
  belongs_to :project, index: true

  has_many :images
  has_many :audios
end
