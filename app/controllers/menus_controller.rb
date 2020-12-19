class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end
  def create
    @menus = params.require(:menus)
    @objective = Objective.find_by(set_flag: "1")
    @new_objective = Objective.new(session["new_objective_data"]["objective"])
    @menus.each do |key, menuContents|
      @menu = Menu.new(menuContents.permit(:week_id, :todo, :time, :effect))

      unless @menu.valid?
        render :new_menu and return
      end
      @new_objective.save
      @menu.objective_id = @new_objective.id
      @menu.save
      
    end

    redirect_to root_path and return

  end

  private

  def menus_params
    params.require(:menus).permit(week_id: [], todo: [], time: [], effect: [])
  end

  def check_flag
    if @objective.present? && @new_objective.set_flag = "1"
      @objective.update(set_flag: "0")
    end
  end
end
