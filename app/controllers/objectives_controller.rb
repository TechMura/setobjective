class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:index]

  def index
    if @objective.presence
      now = Time.now
      @menus = @objective.menus.where(week_id: now.wday)
    end
  end

  def new
    @objective = Objective.new
  end

  def create
    @new_objective = Objective.new(objective_params)
    unless @new_objective.valid?
      @objective = @new_objective
      render :new and return
    end
    session["new_objective_data"] = {objective: @new_objective.attributes}
    @menu = Menu.new
    render new_menu_path
  end

  def show
    @objective = Objective.find(params[:id])
  end

  def edit
    @objective = Objective.find(params[:id])
  end

  def update
    @objective = Objective.find(params[:id])
    if @objective.update(objective_params)
      redirect_to objective_path(@objective.id)
    else
      render :edit
    end
  end

  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def objective_params
    params.require(:objective).permit(:declaration, :reason, :reward, :set_flag).merge(user_id: current_user.id)
  end

  def set_objective
    if user_signed_in?
      @objective = Objective.find_by(user_id: current_user.id,set_flag: "1")
    end
  end

end
