class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def leave
  end

  def new
    @user = User.new
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
end