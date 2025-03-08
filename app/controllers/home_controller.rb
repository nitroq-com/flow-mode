class HomeController < ApplicationController
  def index
    @study_materials = StudyMaterial.all
  end
end
