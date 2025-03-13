class EventsController < ApplicationController
  def home
    render({ template: "events_templates/home" })
  end
end
