class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def leave
  end

  def search
    @user = User.search(params[:search])
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
        redirect_to user_path(@user),notice: "succsess!"
    else
      render :edit
    end
    if params[:user][:image_ids]
    params[:user][:image_ids].each do |image_id|
    image = @user.images.find(image_id)
    image.purge
    end
    end
  end

  def new
    @user = User.new
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        # 保存後にUserMailerを使ってwelcomeメールを送信
        UserMailer.with(user: @user).welcome_email.deliver_later
 
        format.html { redirect_to(@user, notice: 'ユーザーが正常に作成されました。') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def user_params
    params.fetch(:user, {}).permit(:name,:twitter_id, :livein, :maker, :introduce, :syasyu, images: [])
  end
end
