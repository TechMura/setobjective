class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def show
    @objectives = current_user.objectives.order(id: "DESC")
  end
end
