require 'rails_helper'

RSpec.describe 'User Interactions', type: :system do # Or a more descriptive name
  let!(:user) { create(:user, email: 'test_user@example.com', password: 'password', password_confirmation: 'password') }

  before(:each) do
    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end

  it 'allows an existing user to sign in' do
    # ... (your existing sign-in test)
  end

  it 'allows a user to create a new post' do
    # Targeting the <i> tag within the anchor
    find('a.text-dark[data-bs-target="#staticBackdrop"] i.fa-square-plus').click
    expect(page).to have_content('Create new post')

    file_path = Rails.root.join('spec/fixtures/mr-bean.png')
    sleep(20)
    find('input[type="file"][name="post[images][]"]')

    attach_file('post[images][]', file_path)

    fill_in 'post[caption]', with: 'Mr. Bean Test Post'
    click_button 'Post'
    expect(page).to have_content('Post was successfully created')
  end

    it 'allows a user to view their own posts' do
      # 1. Click the dropdown trigger (the image)
      find('.dropdown > a[data-bs-toggle="dropdown"]').click

      # 2. Wait for the dropdown menu to appear
      expect(page).to have_css('.dropdown-menu', visible: true) # Or adjust the selector if needed

      # 3. Click the "Profile" link within the dropdown
      within('.dropdown-menu') do
        click_link 'Profile'
      end

      # 4. Assert that you're on the profile page
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content(user.posts.count)
    end
  # ... other system tests that require a signed-in user
end
