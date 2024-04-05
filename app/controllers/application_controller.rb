class ApplicationController < ActionController::API
  before_action :validate_session_token
  before_action :can_acces?

  def validate_session_token
    return unless params[:t].blank? && request.headers['X-PI-TOKEN'].blank? ||
      ((params[:t].present? || request.headers['X-PI-TOKEN'].present?) && current_user.blank?) ||
      (current_user&.expire_session_at.blank? || current_user&.expire_session_at&.<(Time.now))

    current_user&.logout

    render json: { mssg: "Debe inicias sessión nuevamente" }, status: :unauthorized
  end

  def can_acces?
    position = current_user&.position&.name
    access = case self.class
    when UsersController
      ["Super user"].include?(position)
    when ClientsController
      ["Administrador", "Super user"].include?(position)
    when ProjectsController
      ["Obrero", "Arquitecto", "Super user"].include?(position)
    when TasksController
      ["Obrero", "Arquitecto", "Super user"].include?(position)
    else
      true
    end

    unless access
      render json: { mssg: "Acceso no permitido" }, status: :forbidden
    end
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
