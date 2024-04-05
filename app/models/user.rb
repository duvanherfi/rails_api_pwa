class User  < Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :password, type: String
  field :session_token, type: String
  field :expire_session_at, type: DateTime
  field :active, type: Mongoid::Boolean, default: true
  belongs_to :position, optional: true

  before_create :encrypted_password

  def encrypted_password
    self.password = Digest::SHA256.new.hexdigest(self.password)
  end

  def self.authenticate(email:, password:)
    user = User.where(email: email).first
    return [false, "Cuenta desactivada"] if user && !user.active

    if user && user&.password == Digest::SHA256.new.hexdigest(password)
      user.generate_session_token
      return [true, user]
    end
    [false, "Email ó contraseña incorrecta"]
  end

  def generate_session_token
    self.session_token = loop do
      random_token = SecureRandom.urlsafe_base64(40)
      break random_token unless self.class.where(session_token: random_token).exists?
    end
    self.expire_session_at = 1.hour.after
    self.save
  end

  def logout
    self.update(session_token: nil)
  end
end
