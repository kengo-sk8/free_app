class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  っっw

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '' && password == ''
    end
  end
end

end
