require "clerk/authenticatable"

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Clerk::Authenticatable

  helper_method :current_user

  content_security_policy do |policy|
    policy.base_uri :self, -> { "https://#{clerk_frontend_api()}" }
  end

  def current_user
    @current_user ||= clerk_user
  end
end
