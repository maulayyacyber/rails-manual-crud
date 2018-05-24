# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6LfTagsUAAAAADXyz4ANBAxHzwbGbrQf0ucwPPc4'
  config.secret_key = '6LfTagsUAAAAAMH_iw0hEEaIyyW9n0UcwxLf5Tgp'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end