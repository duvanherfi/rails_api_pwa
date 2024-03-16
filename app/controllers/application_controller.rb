class ApplicationController < ActionController::API


  def validate_session_token
    return unless params[:t].blank? && request.headers['X-PI-TOKEN'].blank? ||
      ((params[:t].present? || request.headers['X-PI-TOKEN'].present?) && current_user.blank?)

    render json: { mssg: "Debe inicias sessión nuevamente" }, status: :unauthorized
  end

  def current_user
    if params[:t]
      query = User.where(session_token: params[:t])
    else
      query = User.where(session_token: request.headers['X-PI-TOKEN'])
    end

    if !@current_user
      @current_user = query.first
    end
    @current_user
  end
end
