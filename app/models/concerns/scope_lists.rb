# frozen_string_literal: true

module ScopeLists
  extend ActiveSupport::Concern
  included do
    # Scope lists
    # -----------
    # all_by_group
    scope :all_by_group,  -> { order(position: :asc) }
    # Scheduled
    scope :scheduled,     -> { where(published: true).where("published_at > ?", Time.zone.now).order(position: :asc) }
    # Published
    scope :published,     -> { where(published: true).where("published_at <= ?", Time.zone.now).order(position: :asc) }
    # Unpublished
    scope :unpublished,   -> { where(published: false).order(position: :asc) }
  end
end
