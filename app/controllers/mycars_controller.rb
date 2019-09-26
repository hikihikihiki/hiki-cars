class MycarsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def top
  end

  def index
    @mycar = Mycar.new
    @mycars = Mycars.all.page(params[:page]).per(8)
    @user = current_user
  end

  def show
    @mycar = Mycar.find(params[:id])
    @mycars = Mycar.all
    @user = User.find(@mycar.user.id)
  end
  def edit
    @mycar = Mycar.find(params[:id])

  end

  def create
    @mycar = Mycar.new
    @mycars = Mycar.all
  end

  def destroy
    @mycar = Mycar.find(params[:id])
  end

  def search
    @mycars = Mycars.search(params[:search]).page(params[:page]).per(8)
  end

private
  def mycar_params
    params.require(:mycar).permit(:type,:body, images: [])
  end

  
end
