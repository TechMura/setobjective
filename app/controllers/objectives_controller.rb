class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:index, :update]
  before_action :authenticate_user!, except: [:index]

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
    @menus = @objective.menus.to_json
  end

  def edit
    @update_objective = Objective.find(params[:id])
  end

  def update
    @update_objective = Objective.find(params[:id])
    if @update_objective.update(objective_params)
      if @objective.present? && @update_objective.set_flag
        @objective.update(set_flag: "0")
      end
      redirect_to objective_path(@update_objective.id)
    else
      @update_objective.valid?
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
