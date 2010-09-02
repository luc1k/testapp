# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_post(post)
    returning(post) do |p|
      p.comments.build if p.comments.empty?
    end
  end
  def show_username_by_id(user_id)
    @user = User.find(user_id)
    @user.name
  end
end
