# spec/system/user_authentication_spec.rb

require 'rails_helper'

RSpec.describe 'User Authentication', type: :system do

  describe 'Sign In' do
    let!(:user) { create(:user, email: 'new_user_2@example.com', password: 'password', password_confirmation: 'password') }

    it 'allows an existing user to sign in' do
      visit new_user_session_path # Adjust the path if needed

      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully.')
    end
  end
end
