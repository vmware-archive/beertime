class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_USERNAME'],
                               password: ENV['HTTP_BASIC_AUTH_PASSWORD'],
                               except: :index
  protect_from_forgery with: :exception
end
