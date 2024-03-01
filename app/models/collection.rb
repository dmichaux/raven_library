class Collection < ApplicationRecord
  has_many :writings,
           dependent: :restrict_with_exception


  scope :alpha_order, -> {order(:name)}

  def publish_all
    return if archived?

    Writing.publish_by_collection(id)
  end

  def archived?
    archived_at.present?    
  end

  def archive
    update(archived_at: Time.zone.current)
    Writing.archive(id)
  end
  
  def de_archive
    update(archived_at: nil)
    Writing.de_archive(id)
  end
end
