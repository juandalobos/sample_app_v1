module UsersHelper

  # Devuelve una imagen Gravatar para el usuario especificado con opciones personalizables.
  def gravatar_for(user, size: 80, alt: nil, class: nil)
    email_hash = Digest::MD5.hexdigest(user.email.downcase)
    alt_text = alt || user.name
    classes = class

    gravatar_url = "https://secure.gravatar.com/avatar/#{email_hash}?s=#{size}"
    image_tag(gravatar_url, alt: alt_text, class: classes)
  end

end