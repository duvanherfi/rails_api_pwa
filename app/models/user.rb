class User  < Person
  include Mongoid::Document
  include Mongoid::Timestamps
  field :session_token, type: String
  belongs_to :position, optional: true

  before_create :encrypted_password

  def encrypted_password
    self.password = Digest::SHA256.new.hexdigest(self.password)
  end

  def self.authenticate(email:, password:)
    user = User.where(email: email).first

    if user&.password == Digest::SHA256.new.hexdigest(password)
      user.generate_session_token
      [true, user]
    else
      [false, "Email ó contraseña incorrecta"]
    end
  end

  def generate_session_token
    self.session_token = loop do
      random_token = SecureRandom.urlsafe_base64(40)
      break random_token unless self.class.where(session_token: random_token).exists?
    end
    self.save
  end

  def logout
    self.update(session_token: nil)
  end
end
