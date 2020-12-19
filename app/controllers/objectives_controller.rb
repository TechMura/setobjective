class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:index]

  def index
  end

  def new
    @objective = Objective.new
  end

  def create
    @new_objective = Objective.new(objective_params)
    unless @new_objective.valid?
      render :new and return
    end
    session["new_objective_data"] = {objective: @new_objective.attributes}
    redirect_to new_menu_path

  end

  private

  def objective_params
    params.require(:objective).permit(:declaration, :reason, :reward, :set_flag).merge(user_id: current_user.id)
  end

  def set_objective
    @objective = Objective.find_by(set_flag: "1")
  end

end
