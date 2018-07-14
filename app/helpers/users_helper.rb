module UsersHelper
  def show_avatar_for user
    image_tag(user.image.url, class: "img-circle img-responsive")
  end
end
