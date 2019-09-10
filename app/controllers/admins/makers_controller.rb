class Admins::MakersController < Admins::ApplicationController

  def index
    @new_maker = Maker.new
    @maker = Maker.order("name")
    @makers = Maker.all
  end

  def edit
    @new_maker = Maker.new
    @edit_maker = Maker.find(params[:id])
    @makers = Maker.all
    render 'index'
  end

  def create
    Maker.create!(maker_params)
    redirect_to admins_makers_path
  end

  def update
    Maker.find(params[:id]).update!(maker_params)
    redirect_to admins_makers_path
  end

  def destroy
    Maker.find(params[:id]).destroy
    redirect_to admins_makers_path
  end

private

  def maker_params
    params.require(:maker).permit(:maker)
  end

end
