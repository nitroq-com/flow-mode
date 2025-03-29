class StudyMaterialsController < ApplicationController
  before_action :set_study_materials, only: %i[index create edit update]
  before_action :set_study_material, only: %i[show edit update destroy]

  def index
    @study_material = StudyMaterial.new
  end

  def show
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.replace(
            "study_material_modal",
            partial: "study_materials/form",
            locals: { study_material: @study_material }
          )
        )
      end

      format.html { render :index }
    end
  end

  def create
    @study_material = StudyMaterial.new(study_material_params)
    respond_to do |format|
      if @study_material.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "study_materials_content",
            partial: "study_materials/index",
            locals: { study_materials: @study_materials, study_material: StudyMaterial.new }
          )
        end
        format.html { redirect_to study_materials_path, notice: "Study material was successfully created." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "study_material_modal",
            partial: "study_materials/form",
            locals: { study_material: @study_material }
          )
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @study_material.update(study_material_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "study_materials_content",
            partial: "study_materials/index",
            locals: { study_materials: @study_materials, study_material: StudyMaterial.new }
          )
        end
        format.html { redirect_to study_materials_path, notice: "Study material was successfully updated." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "study_material_modal",
            partial: "study_materials/form",
            locals: { study_material: @study_material }
          )
        end
        format.html { render :index, status: :unprocessable_entity }
      end
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

  def set_study_materials
    @study_materials = StudyMaterial.all.order(position: :asc)
  end

  def study_material_params
    params.require(:study_material).permit(
      :subject, :material_type, :description, :total_duration, :time_spent,
      :total_pages, :pages_read, :position, :resource_link
    )
  end
end
