# spec/support/chrome.rb
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome do |options|
      options.add_argument('--no-sandbox')
      options.add_argument('--disable-dev-shm-usage')
      options.add_argument('--disable-gpu')
      # options.add_argument('--headless') # Comment out or remove this line
    end
  end
end
