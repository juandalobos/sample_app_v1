class User < ApplicationRecord
  attr_accessor :remember_token

  # Asegura que el correo se guarda en minúsculas
  before_save { self.email = email.downcase }

  # Expresión regular más robusta para validar emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Validaciones
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Devuelve el hash digest de la cadena dada
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Devuelve un token aleatorio
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Recuerda a un usuario para una sesión persistente
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Verifica si un token coincide con el digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Olvida al usuario persistente
  def forget
    update_attribute(:remember_digest, nil)
  end
end