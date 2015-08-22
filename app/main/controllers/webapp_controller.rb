module Main
  class WebappController < Volt::ModelController
    model :store
    def index
    end

    def add_event
      event = Event.new
      event.name = page._event_name
      event.location = page._event_location + ", Trivandrum"
      event.content = page._event_content
      event.type = "Accident"
      event.created_time = Time.now
      _events << event

      clear_page
    end

    def clear_page
      page._event_name = ""
      page._event_location = ""
      page._event_content = ""
    end

  end
end

