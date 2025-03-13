class EventJoinRequestsController < ApplicationController
  def index
    matching_event_join_requests = EventJoinRequest.all

    @list_of_event_join_requests = matching_event_join_requests.order({ :created_at => :desc })

    render({ :template => "event_join_requests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_event_join_requests = EventJoinRequest.where({ :id => the_id })

    @the_event_join_request = matching_event_join_requests.at(0)

    render({ :template => "event_join_requests/show" })
  end

  def create
    the_event_join_request = EventJoinRequest.new
    the_event_join_request.event_id = params.fetch("query_event_id")
    the_event_join_request.guest_id = params.fetch("query_guest_id")
    the_event_join_request.status = params.fetch("query_status")

    if the_event_join_request.valid?
      the_event_join_request.save
      redirect_to("/event_join_requests", { :notice => "Event join request created successfully." })
    else
      redirect_to("/event_join_requests", { :alert => the_event_join_request.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event_join_request = EventJoinRequest.where({ :id => the_id }).at(0)

    the_event_join_request.event_id = params.fetch("query_event_id")
    the_event_join_request.guest_id = params.fetch("query_guest_id")
    the_event_join_request.status = params.fetch("query_status")

    if the_event_join_request.valid?
      the_event_join_request.save
      redirect_to("/event_join_requests/#{the_event_join_request.id}", { :notice => "Event join request updated successfully."} )
    else
      redirect_to("/event_join_requests/#{the_event_join_request.id}", { :alert => the_event_join_request.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event_join_request = EventJoinRequest.where({ :id => the_id }).at(0)

    the_event_join_request.destroy

    redirect_to("/event_join_requests", { :notice => "Event join request deleted successfully."} )
  end
end
