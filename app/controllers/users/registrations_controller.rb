# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, except: [:new, :create] # Skip authentication ONLY for new and create

  def update
    super
  end
end
