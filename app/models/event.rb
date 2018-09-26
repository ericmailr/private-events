class Event < ApplicationRecord
    belongs_to :host, :class_name => "User"
    has_many :invitations
    has_many :invitees, :through => :invitations
    has_many :attendees, :through => :invitations

    scope :upcoming, lambda { where("#{:date} >= ?", Date.today) }
    scope :past, lambda { where("#{:date} < ?", Date.today) }

    default_scope -> { order(:date) }
end
