class User < ApplicationRecord
    has_secure_password
    has_many :hosting_events, :foreign_key => "host_id", :class_name => "Event"
    has_many :invitations, :foreign_key => "invitee_id"
    has_many :invited_events, :foreign_key => "invitee_id", :through => :invitations, :source => "event"
    has_many :attended_events, :foreign_key => "attendee_id", :through => :invitations, :source => "event"

    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
end
