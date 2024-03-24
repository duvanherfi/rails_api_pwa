class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  #before_action :validate_session_token, except: [:login, :create]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def login
    valid, obj = User.authenticate(email: params[:email], password: params[:password])

    if valid
      render json: obj
    else
      render json: obj, status: :unprocessable_entity
    end
  end

  def logout
    current_user.logout
    render json: {mssg: 'Sessión cerrada'}, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :active, :identification, :position_id)
    end
end
