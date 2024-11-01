class HomeController < ApplicationController
  before_action :require_reverification, only: :foo

  def index
  end

  def foo
    render json: { foo: "bar" }
  end

  private

  def require_reverification
    if clerk_session_needs_reverification?
      clerk_render_reverification and return
    end
  end
end
