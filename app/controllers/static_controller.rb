class StaticController < ApplicationController
  def homepage
    @user = current_user
  end
end
