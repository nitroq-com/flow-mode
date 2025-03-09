class StudyMaterialsController < ApplicationController
  before_action :set_study_material, only: %i[show edit update destroy]

  def index
    @study_materials = StudyMaterial.all
  end

  def show
  end

  def new
    @study_material = StudyMaterial.new
  end

  def edit
  end

  def create
    @study_material = StudyMaterial.new(study_material_params)

    if @study_material.save
      redirect_to study_materials_path, notice: "Study material was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @study_material.update(study_material_params)
      redirect_to study_materials_path, notice: "Study material was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @study_material.destroy!
    redirect_to study_materials_path, notice: "Study material was successfully destroyed."
  end

  private

  def set_study_material
    @study_material = StudyMaterial.find(params[:id])
  end

  def study_material_params
    params.require(:study_material).permit(:subject, :material_type, :description, :total_duration, :time_spent, :total_pages, :pages_read, :position, :resource_link)
  end
end
