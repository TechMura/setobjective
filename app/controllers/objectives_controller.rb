class ObjectivesController < ApplicationController
  before_action :set_setting_objective, only: [:index, :update]
  before_action :set_objective, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]

  def index
    if @setting_objective.presence
      now = Time.now
      @menus = @setting_objective.menus.where(week_id: now.wday)
    end
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objective_params)
    unless @objective.valid?
      render :new and return
    end
    session["new_objective_data"] = {objective: @objective.attributes}
    @menu = Menu.new
    render new_menu_path
  end

  def show
    @menus = @objective.menus.to_json
  end

  def edit
  end

  def update
    if @objective.update(objective_params)
      if @setting_objective.present? && @objective.set_flag && @objective != @setting_objective
        @setting_objective.update(set_flag: "0")
      end
      redirect_to objective_path(@objective.id)
    else
      @objective.valid?
      render :edit
    end
  end

  def destroy
    @objective.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def objective_params
    params.require(:objective).permit(:declaration, :reason, :reward, :set_flag).merge(user_id: current_user.id)
  end

  def set_setting_objective
    if user_signed_in?
      @setting_objective = Objective.find_by(user_id: current_user.id,set_flag: "1")
    end
  end

  def set_objective
    unless Objective.find_by(id: params[:id])
      redirect_to root_path
    else
      @objective = Objective.find(params[:id])
    end
  end

  def move_to_index
    if current_user.id != @objective.user.id
      redirect_to root_path
    end
  end

end
