class EventRegistrationsController < ApplicationController
  def index
    matching_event_registrations = EventRegistration.all

    @list_of_event_registrations = matching_event_registrations.order({ :created_at => :desc })

    render({ :template => "event_registrations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_event_registrations = EventRegistration.where({ :id => the_id })

    @the_event_registration = matching_event_registrations.at(0)

    render({ :template => "event_registrations/show" })
  end

  def create
    the_event_registration = EventRegistration.new
    the_event_registration.user_id = params.fetch("query_user_id")
    the_event_registration.event_id = params.fetch("query_event_id")

    if the_event_registration.valid?
      the_event_registration.save
      redirect_to("/event_registrations", { :notice => "Event registration created successfully." })
    else
      redirect_to("/event_registrations", { :alert => the_event_registration.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event_registration = EventRegistration.where({ :id => the_id }).at(0)

    the_event_registration.user_id = params.fetch("query_user_id")
    the_event_registration.event_id = params.fetch("query_event_id")

    if the_event_registration.valid?
      the_event_registration.save
      redirect_to("/event_registrations/#{the_event_registration.id}", { :notice => "Event registration updated successfully."} )
    else
      redirect_to("/event_registrations/#{the_event_registration.id}", { :alert => the_event_registration.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event_registration = EventRegistration.where({ :id => the_id }).at(0)

    the_event_registration.destroy

    redirect_to("/event_registrations", { :notice => "Event registration deleted successfully."} )
  end
end
