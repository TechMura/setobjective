class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:index, :create]

  def index
  end

  def new
    @objective = Objective.new
  end

  def create
    @new_objective = Objective.new(objective_params)
    if @objective.present? && @new_objective.set_flag = "1"
      @objective.update(set_flag: "0")
    end
    if @new_objective.valid?
      @new_objective.save
      redirect_to root_path
    end
  end

  private

  def objective_params
    params.require(:objective).permit(:declaration, :reason, :reward, :set_flag).merge(user_id: current_user.id)
  end

  def set_objective
    @objective = Objective.find_by(set_flag: "1")
  end

end
