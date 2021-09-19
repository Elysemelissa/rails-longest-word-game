class ApplicationController < ActionController::Base
   skip_before_action :verify_authenticity_token
   before_action :set_session

  private

  def set_session
    session[:score]   ||= 0
  end
end
