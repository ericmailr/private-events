class AddAttendeeIdToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :attendee_id, :integer
  end
end
