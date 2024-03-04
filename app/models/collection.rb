class Collection < ApplicationRecord
  has_many :writings,
           dependent: :restrict_with_exception
  has_many :published_writings,
           -> { where('writings.published_at IS NOT NULL') },
           class_name: 'Writing',
           dependent: :restrict_with_exception


  scope :alpha_order, -> { order(:name) }
  scope :published, -> { where.not(published_at: nil) }

  def published?
    published_at.present?    
  end

  def publish
    return if archived? || published?

    update(published_at: Time.zone.now)
  end

  def unpublish
    return unless published?

    update(published_at: nil)
  end

  def publish_writings
    return if archived?

    Writing.publish_by_collection(id)
  end

  def archived?
    archived_at.present?    
  end

  def archive
    update(archived_at: Time.zone.current)
    # Writing.archive(id)
  end
  
  def de_archive
    update(archived_at: nil)
    # Writing.de_archive(id)
  end
end
