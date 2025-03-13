class EventInvitationsController < ApplicationController
  def index
    matching_event_invitations = EventInvitation.all

    @list_of_event_invitations = matching_event_invitations.order({ :created_at => :desc })

    render({ :template => "event_invitations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_event_invitations = EventInvitation.where({ :id => the_id })

    @the_event_invitation = matching_event_invitations.at(0)

    render({ :template => "event_invitations/show" })
  end

  def create
    the_event_invitation = EventInvitation.new
    the_event_invitation.event_id = params.fetch("query_event_id")
    the_event_invitation.guest_id = params.fetch("query_guest_id")
    the_event_invitation.status = params.fetch("query_status")

    if the_event_invitation.valid?
      the_event_invitation.save
      redirect_to("/event_invitations", { :notice => "Event invitation created successfully." })
    else
      redirect_to("/event_invitations", { :alert => the_event_invitation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event_invitation = EventInvitation.where({ :id => the_id }).at(0)

    the_event_invitation.event_id = params.fetch("query_event_id")
    the_event_invitation.guest_id = params.fetch("query_guest_id")
    the_event_invitation.status = params.fetch("query_status")

    if the_event_invitation.valid?
      the_event_invitation.save
      redirect_to("/event_invitations/#{the_event_invitation.id}", { :notice => "Event invitation updated successfully."} )
    else
      redirect_to("/event_invitations/#{the_event_invitation.id}", { :alert => the_event_invitation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event_invitation = EventInvitation.where({ :id => the_id }).at(0)

    the_event_invitation.destroy

    redirect_to("/event_invitations", { :notice => "Event invitation deleted successfully."} )
  end
end
