class Admin::SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update destroy approve reject]

  def index
    @schools = School.order(created_at: :desc).limit(100)
    @approved_schools_count = School.approved.count
    @pending_schools_count = School.pending.count
    @rejected_schools_count = School.rejected.count
  end

  def show
  end

  def new
    @school = School.new(status: :pending)
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to admin_school_path(@school), notice: "Okul oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to admin_school_path(@school), notice: "Okul güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @school.destroy
      redirect_to admin_schools_path, notice: "Okul silindi."
    else
      redirect_to admin_school_path(@school), alert: @school.errors.full_messages.to_sentence.presence || "Okul silinemedi."
    end
  end

  def approve
    @school.update(status: :approved)
    redirect_to admin_school_path(@school), notice: "Okul onaylandı."
  end

  def reject
    @school.update(status: :rejected)
    redirect_to admin_school_path(@school), notice: "Okul reddedildi."
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :email, :phone, :tax_number, :address, :status)
  end
end
