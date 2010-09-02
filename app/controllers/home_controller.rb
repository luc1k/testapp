class HomeController < ApplicationController
  def index
    @posts = Post.find_posts(0)
  end

end
