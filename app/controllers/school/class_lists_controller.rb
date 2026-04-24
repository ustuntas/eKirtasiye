class School::ClassListsController < ApplicationController
  before_action :require_school_admin!
  before_action :set_current_school
  before_action :set_class_list, only: %i[show edit update destroy publish unpublish versions]

  def index
    @class_lists = @current_school.school_class_lists.includes(:classroom).order(created_at: :desc)
    @active_count = @current_school.school_class_lists.active.count
    @total_count = @class_lists.size
  end

  def show
  end

  def new
    @class_list = @current_school.school_class_lists.new(active: true, version: next_version_default)
  end

  def create
    @class_list = @current_school.school_class_lists.new(class_list_params)

    if @class_list.save
      redirect_to school_class_list_path(@class_list), notice: "Sınıf listesi oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @class_list.update(class_list_params)
      redirect_to school_class_list_path(@class_list), notice: "Sınıf listesi güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @class_list.destroy
      redirect_to school_class_lists_path, notice: "Sınıf listesi silindi."
    else
      redirect_to school_class_list_path(@class_list), alert: @class_list.errors.full_messages.to_sentence.presence || "Sınıf listesi silinemedi."
    end
  end

  def publish
    @class_list.update(active: true)
    redirect_to school_class_list_path(@class_list), notice: "Sınıf listesi yayına alındı."
  end

  def unpublish
    @class_list.update(active: false)
    redirect_to school_class_list_path(@class_list), notice: "Sınıf listesi yayından kaldırıldı."
  end

  def versions
    @versions = @current_school.school_class_lists
      .where(classroom_id: @class_list.classroom_id)
      .where(name: @class_list.name)
      .order(version: :desc, created_at: :desc)
  end

  private

  def require_school_admin!
    return if Current.user&.school_admin?

    redirect_to root_path, alert: "Bu alana erişim yetkiniz yok."
  end

  def set_current_school
    @current_school = Current.user&.school_account&.school
    return if @current_school

    redirect_to root_path, alert: "Okul hesabı bulunamadı."
  end

  def set_class_list
    @class_list = @current_school.school_class_lists.find(params[:id])
  end

  def class_list_params
    params.require(:school_class_list).permit(:classroom_id, :name, :academic_year, :semester, :version, :active)
  end

  def next_version_default
    (@current_school.school_class_lists.maximum(:version) || 0) + 1
  end
end
