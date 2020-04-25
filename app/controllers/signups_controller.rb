class SignupsController < ApplicationController
  def index
  end

  def step1
    @user = User.new
  end

end
