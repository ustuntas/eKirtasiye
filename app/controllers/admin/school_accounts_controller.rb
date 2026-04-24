class Admin::SchoolAccountsController < ApplicationController
  before_action :set_school_account, only: %i[show edit update destroy approve reject]

  def index
    @school_accounts = SchoolAccount.includes(:school, :user).order(created_at: :desc).limit(150)
    @pending_count = SchoolAccount.pending.count
    @approved_count = SchoolAccount.approved.count
    @rejected_count = SchoolAccount.rejected.count
  end

  def show
  end

  def new
    @school_account = SchoolAccount.new(status: :pending)
  end

  def create
    @school_account = SchoolAccount.new(school_account_params)

    if @school_account.save
      redirect_to admin_school_account_path(@school_account), notice: "Okul hesabı oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @school_account.update(school_account_params)
      redirect_to admin_school_account_path(@school_account), notice: "Okul hesabı güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @school_account.destroy
      redirect_to admin_school_accounts_path, notice: "Okul hesabı silindi."
    else
      redirect_to admin_school_account_path(@school_account), alert: @school_account.errors.full_messages.to_sentence.presence || "Okul hesabı silinemedi."
    end
  end

  def approve
    @school_account.update(status: :approved)
    redirect_to admin_school_account_path(@school_account), notice: "Okul hesabı onaylandı."
  end

  def reject
    @school_account.update(status: :rejected)
    redirect_to admin_school_account_path(@school_account), notice: "Okul hesabı reddedildi."
  end

  private

  def set_school_account
    @school_account = SchoolAccount.includes(:school, :user).find(params[:id])
  end

  def school_account_params
    params.require(:school_account).permit(:school_id, :user_id, :responsible_person, :phone, :status)
  end
end
