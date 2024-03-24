class Audio
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :task, index: true

  mount_uploader :file, AudioUploader
end
