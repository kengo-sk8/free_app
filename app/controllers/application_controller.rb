class ApplicationController < ActionController::Base
  before_action :basic_auth
  # , if: :production?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end

    # def production?
    #   Rails.env.production?
    # end
  end
end

#   before_action :basic_auth

#   private
#   def basic_auth
#     authenticate_or_request_with_http_basic do |username, password|
#       username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
#     end
#   end
# end