class UsersController < ApplicationController
  def show
    @objectives = current_user.objectives
  end
end
