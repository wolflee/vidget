module SessionsHelper
  def sign_in(user)
    #user = User.find_by_remember_token(session[:remember_token])
    #current_user = user if user
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def returned_visitor?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user || User.find_by(remember_token: cookies[:remember_token])
    #@current_user || User.where(remember_token: cookies[:remember_token]).first
  end

  def sign_out
    self.current_user = nil
    cookies.delete[:remember_token]
  end
end
