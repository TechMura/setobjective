class MenusController < ApplicationController
  def new
  end

  def create
    @objective = Objective.find_by(user_id: current_user.id,set_flag: "1")
    @new_objective = Objective.new(session["new_objective_data"]["objective"])
    @new_objective.save
    check_flag
    @menus = params.require(:menus)
    @menus.each do |key, menuContents|
      @menu = Menu.new(menuContents.permit(:week_id, :todo, :time, :effect))
      unless @menu.valid?
        render :new_menu and return
      end

      @menu.objective_id = @new_objective.id
      @menu.save
    end
    redirect_to root_path and return
  end

  def add_edit
    @objective = Objective.find(params[:objective_id])
    @menus = @objective.menus
    session["objective_id"] = {objective_id: @objective.id}
    @menu = Menu.new
    
  end

  def add_update
    @menus = params.require(:menus)
    objective_id = session["objective_id"]["objective_id"]
    @menus.each do |key, menuContents|
      @menu = Menu.new(menuContents.permit(:week_id, :todo, :time, :effect))
      unless @menu.valid?
        render :new_menu and return
      end
      @menu.objective_id = objective_id
      @menu.save
    end
    redirect_to objective_path(objective_id) and return
  end

  private

  def menus_params
    params.require(:menus).permit(week_id: [], todo: [], time: [], effect: [])
  end

  def check_flag
    binding.pry
    if @objective.present? && @new_objective.set_flag
      @objective.update(set_flag: "0")
    end
  end
end
