# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins "http://localhost:3000"
    origins "https://donmaru-app-new.vercel.app"

    resource "*",
      headers: :any,
      expose: ["Authorization"], # 追加 これがないとjsでtokenが取得できない
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true # クレデンシャルモードを有効にする
  end
end
