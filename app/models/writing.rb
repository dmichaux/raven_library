class Writing < ApplicationRecord
  belongs_to :collection

  acts_as_list scope: :collection
  has_rich_text :content

  scope :by_position, -> {order(:position)}
  scope :published, -> { where.not(published_at: nil) }

  def self.publish_by_collection(collection_id)
    where(collection_id: collection_id)
    .each(&:publish)
  end

  def self.archive(collection_id)
    where(collection_id: collection_id)
    .update_all(published_at: nil, archived_at: Time.zone.current)
  end

  # does not re-publish
  def self.de_archive(collection_id)
    where(collection_id: collection_id)
    .update_all(archived_at: nil)
  end

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

  def archived?
    archived_at.present?
  end

  def archive
    return if archived?

    update(published_at: nil, archived_at: Time.zone.current)
  end

  # does not re-publish
  def de_archive
    return unless archived?

    update(archived_at: nil)
  end

  def author_fullname
    "#{author_first}#{(' ' + author_middle) if author_middle?} #{author_last}"
  end

  def pub_date
    published_at&.strftime('%Y') || 'unpublished'
  end
end
