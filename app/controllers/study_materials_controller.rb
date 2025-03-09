class StudyMaterialsController < ApplicationController
  def index
    @study_materials = StudyMaterial.all
  end

  def new
    @study_material = StudyMaterial.new
  end

  def create
    @study_material = StudyMaterial.new(study_material_params)

    if @study_material.save
      redirect_to study_materials_path, notice: "Study material was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def study_material_params
    params
      .require(:study_material)
      .permit(:subject, :material_type, :description, :total_duration, :time_spent, :total_pages, :pages_read, :position, :resource_link)
  end
end
