module UsersHelper
  # Devuelve la URL del avatar de Gravatar, no una etiqueta <img>
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
end