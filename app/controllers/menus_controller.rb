class MenusController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @objective = Objective.find_by(user_id: current_user.id,set_flag: "1")
    @new_objective = Objective.new(session["new_objective_data"]["objective"])
    @new_objective.save
    check_flag
    if params[:menus]
      @menus = params.require(:menus)
      @menus.each do |key, menuContents|
        @menu = Menu.new(menuContents.permit(:week_id, :todo, :time, :effect))
        unless @menu.valid?
          render :new_menu and return
        end
        @menu.objective_id = @new_objective.id
        @menu.save
      end
    end
    redirect_to root_path and return
  end

  def show
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    # destroy.js.erbで表示を消す
    render 'destroy.js.erb'
  end

  def multi_edit
    @objective = Objective.find(params[:objective_id])
    @menus = @objective.menus
    session["objective_id"] = {objective_id: @objective.id}
    @menu = Menu.new
  end

  def add_create
    objective_id = session["objective_id"]["objective_id"]
    @objective = Objective.find(objective_id)
    @menus = @objective.menus
    params_menu = params[:menu]
    menu = Menu.create(week_id: params_menu[:week_id], todo: params_menu[:todo],time: params_menu[:time], effect: params_menu[:effect], objective_id: objective_id)
    render json:{ menu: menu }
  end

  def achieved
    menu = Menu.find(params[:id])
    if menu.achieve_flag
      menu.update(achieve_flag: false)
    else
      menu.update(achieve_flag: true)
    end
    item = Menu.find(params[:id])
    render json: { menu: item }
  end

  def reset_achieve_flag
    menu = Menu.find(params[:id])
    menu.update(achieve_flag: false)
    item = Menu.find(params[:id])
    render json: { menu: item }
  end

  private

  def menus_params
    params.require(:menus).permit(week_id: [], todo: [], time: [], effect: [])
  end

  def check_flag
    if @objective.present? && @new_objective.set_flag
      @objective.update(set_flag: "0")
    end
  end
end
