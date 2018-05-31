class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :define_the_session_key
  
  def define_the_session_key
    if session[:user_key].blank?
      session[:user_key] = request.cookies["_random_phrase_session"]
    end
  end
  
end
