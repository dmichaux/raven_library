class Genre < ApplicationRecord

  # === relationships

  has_many :collections,
           dependent: :restrict_with_exception
  has_many :published_collections,
           -> { where('collections.published_at IS NOT NULL') },
           class_name: 'Collection',
           dependent: :restrict_with_exception

  # === validations

  validates :name, presence: true

  # === scopes

  scope :alpha_order, -> { order(:name) }
  scope :published, -> { where.not(published_at: nil) }

  # === class methods

  # === instance methods

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
    update(archived_at: Time.zone.current)
  end
  
  def de_archive
    update(archived_at: nil)
  end
end
