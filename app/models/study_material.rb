class StudyMaterial < ApplicationRecord
  enum :material_type, [ :course, :ebook, :article, :video ]

  def completed?
    return true if self.pages_read.present? && self.pages_read >= self.total_pages.to_i
    return true if self.time_spent.present? && self.time_spent >= self.total_duration.to_i

    false
  end
end
