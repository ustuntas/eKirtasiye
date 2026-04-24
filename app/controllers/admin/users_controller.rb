class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy change_role toggle_active]

  def index
    @users = User.order(created_at: :desc).limit(150)
    @admin_count = User.where(role: "admin").count
    @school_admin_count = User.where(role: "school_admin").count
    @customer_count = User.where(role: "customer").count
  end

  def show
  end

  def new
    @user = User.new(role: "customer")
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "Kullanıcı oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    permitted = user_params
    permitted = permitted.except(:password) if permitted[:password].blank?

    if @user.update(permitted)
      redirect_to admin_user_path(@user), notice: "Kullanıcı güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "Kullanıcı silindi."
    else
      redirect_to admin_user_path(@user), alert: @user.errors.full_messages.to_sentence.presence || "Kullanıcı silinemedi."
    end
  end

  def change_role
    role = params[:role].to_s

    unless User::ROLES.include?(role)
      redirect_to admin_user_path(@user), alert: "Geçersiz rol."
      return
    end

    if @user.update(role: role)
      redirect_to admin_user_path(@user), notice: "Rol güncellendi."
    else
      redirect_to admin_user_path(@user), alert: @user.errors.full_messages.to_sentence
    end
  end

  def toggle_active
    next_role = @user.visitor? ? "customer" : "visitor"

    if @user.admin?
      redirect_to admin_user_path(@user), alert: "Admin hesabı pasife alınamaz."
      return
    end

    if @user.update(role: next_role)
      redirect_to admin_user_path(@user), notice: "Kullanıcı durumu güncellendi (#{next_role})."
    else
      redirect_to admin_user_path(@user), alert: @user.errors.full_messages.to_sentence
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :role)
  end
end
