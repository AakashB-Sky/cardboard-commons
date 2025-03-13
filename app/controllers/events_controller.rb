class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    render({ :template => "events/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    render({ :template => "events/show" })
  end

  def create
    the_event = Event.new
    the_event.date = params.fetch("query_date")
    the_event.time = params.fetch("query_time")
    the_event.game_id = params.fetch("query_game_id")
    the_event.skill_level = params.fetch("query_skill_level")
    the_event.host_id = params.fetch("query_host_id")
    the_event.seats_available = params.fetch("query_seats_available")
    the_event.seats_total = params.fetch("query_seats_total")
    the_event.neighborhood = params.fetch("query_neighborhood")
    the_event.street_address = params.fetch("query_street_address")
    the_event.address_line_2 = params.fetch("query_address_line_2")
    the_event.city = params.fetch("query_city")
    the_event.state = params.fetch("query_state")
    the_event.zip_code = params.fetch("query_zip_code")
    the_event.description = params.fetch("query_description")
    the_event.visibility = params.fetch("query_visibility")
    the_event.approval_requirement = params.fetch("query_approval_requirement")
    the_event.status = params.fetch("query_status")
    the_event.rsvps_count = params.fetch("query_rsvps_count")

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.date = params.fetch("query_date")
    the_event.time = params.fetch("query_time")
    the_event.game_id = params.fetch("query_game_id")
    the_event.skill_level = params.fetch("query_skill_level")
    the_event.host_id = params.fetch("query_host_id")
    the_event.seats_available = params.fetch("query_seats_available")
    the_event.seats_total = params.fetch("query_seats_total")
    the_event.neighborhood = params.fetch("query_neighborhood")
    the_event.street_address = params.fetch("query_street_address")
    the_event.address_line_2 = params.fetch("query_address_line_2")
    the_event.city = params.fetch("query_city")
    the_event.state = params.fetch("query_state")
    the_event.zip_code = params.fetch("query_zip_code")
    the_event.description = params.fetch("query_description")
    the_event.visibility = params.fetch("query_visibility")
    the_event.approval_requirement = params.fetch("query_approval_requirement")
    the_event.status = params.fetch("query_status")
    the_event.rsvps_count = params.fetch("query_rsvps_count")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
