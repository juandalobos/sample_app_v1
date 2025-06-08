module UsersHelper

  # Gravatar personalizado para el usuario
  def gravatar_for(user, options = {})
    size    = options[:size] || 80
    alt     = options[:alt] || user.name
    classes = options[:class]

    email_hash = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{email_hash}?s=#{size}"

    image_tag(gravatar_url, alt: alt, class: classes)
  end

end