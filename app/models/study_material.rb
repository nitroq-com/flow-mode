class StudyMaterial < ApplicationRecord
  enum :material_type, [ :course, :ebook, :article, :video ]
end
