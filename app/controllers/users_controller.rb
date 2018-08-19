class UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_user, only: [:edit]
before_action :set_current_user, only: [:normal_edit, :normal_update]
before_action :check_classification_admin, only:[:index,:new,:create,:update]

  # GET /tests
  # GET /tests.json
  def index
    @users = User.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @user = User.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @user = User.new(user_all_params.except[:password_confirmation])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @user.update(user_all_params.except[:password_confirmation])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # allow user to change theire data
  def normal_edit
  end

  def normal_update
    update_params=user_normal_params
    unless params[:password].blank? &&  params[:email]==@user.email && params[:user_name] == @user.user_name
      if @user.password!=params[:old_password]
        flash[:alert] += 'Das alte Password falsch'
      end
      if params[:password]!=params[:password_confirmation]
        flash[:alert] += 'Die Passwordwiederholung stimmt nicht überein'
      end

      if @user.password!=params[:old_password] || params[:password]!=params[:password_confirmation]
         render action: "normal_edit"
      end

      update_params = user_normal_params.except(:password_confirmation)
    end
    
    if params[:password].blank?
      update_params = update_params.except(:password)
    end

    if @user.update(update_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to "/accinfo"
    else
      render action: "normal_edit"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def user_all_params
    params.require(:user).permit(:user_name,:first_name,:last_name,:email,:phone,:age,:role,:password,:password_confirmation) if params[:user].present?
  end

  def user_normal_params
    params.require(:user).permit(:user_name,:first_name,:last_name,:email,:phone,:age,:password,:password_confirmation, :old_password) if params[:user].present?
  end
end
