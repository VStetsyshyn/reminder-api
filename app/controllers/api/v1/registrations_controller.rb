module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def create
        build_resource(sign_up_params)

        resource.save
        render_resource(resource)
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :fcm_token)
      end

      def sign_in_params
        params.require(:user).permit(:email, :password, :fcm_token)
      end
    end
  end
end
