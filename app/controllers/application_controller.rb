class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  helper_method :current_user


  def current_user
    @current_user ||= session[:user_id] && Person.find_by(id: session[:user_id])
  end

  private

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
