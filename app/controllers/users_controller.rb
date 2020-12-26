class UsersController < ApplicationController
  def show
    @objectives = current_user.objectives.order(id: "DESC")
  end
end
