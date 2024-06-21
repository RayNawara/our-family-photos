# app/controllers/admin/registrations_controller.rb
class Admin::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]


  def update
    if account_update_params[:admin] == true
      redirect_to root_path, alert: "Only admins can update the admin role." and return unless current_user.admin?
    end
    super
  end
end
