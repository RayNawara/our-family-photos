# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow your production frontend domain
    origins 'our-family-photos.raynawara.com'

    # Allow localhost for development
    origins 'localhost:3000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end

  # Specific configuration for Active Storage direct uploads (if needed)
  allow do
    origins 'our-family-photos.raynawara.com', 'localhost:3000'
    resource '/rails/active_storage/direct_uploads',
      headers: :any,
      methods: [:post, :options],
      credentials: true
  end
end
