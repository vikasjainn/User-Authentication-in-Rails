class UsersController < ApplicationController
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: 'User registered successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = generate_token(user.id)
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def logout
    # Implement logout logic if needed
    render json: { message: 'User logged out successfully' }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def generate_token(user_id)
    JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base)
  end
end
