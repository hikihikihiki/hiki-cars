class MycarsController < ApplicationController

  def top
  end

  def index
    @mycars = Mycars.all.page(params[:page]).per(8)
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def search
    @mycars = Mycars.search(params[:search]).page(params[:page]).per(8)
  end
  
end
