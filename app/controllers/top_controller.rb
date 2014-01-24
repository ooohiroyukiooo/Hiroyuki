class TopController < ApplicationController
  skip_before_filter :authenticate_user

  def index
  end
  
  def not_found
    raise ActionController::RoutingError, "No Route matches #{request.path.inspect}"
  end
end

