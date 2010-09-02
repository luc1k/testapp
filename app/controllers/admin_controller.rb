class AdminController < ApplicationController
  layout "home"
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || {:action => 'index'})
      else
        flash.now[:notice] = "Wrong login/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to({:action => "login"}, :notice => "Logged out. Bye")
  end

  def index
  end

end
