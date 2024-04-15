class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'You are logged in.', user: resource }, status: :ok
    else
      invalid_login_attempt
    end
  end

  def register_success
    render json: { message: 'Signed up sucessfully.', user: resource }
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end
