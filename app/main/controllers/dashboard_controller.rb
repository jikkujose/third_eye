module Main
  class DashboardController < Volt::ModelController
    def index
      page._address = default_address
      page._zoom = zoom
      page._type = "all"
      page._markers = markers
    end

    def locate(location)
      page._address = location
      page._zoom = 13
    end

    def filter_events(type)
      page._type = type
      page._zoom = zoom
      page._address = default_address
      page._markers = markers
    end

    def check_event_type(filter, event)
      if filter == "all"
        return !(event.type == "flying_squad" || event.type == "ambulance")
      end
      ( event.type ==  filter)
    end

    def markers
      store._events.order(:created_at).all do |events|
        events.select do |e|
          check_event_type(page._type, e)
        end
      end
    end

    def default_address
      "Technopark, Trivandrum"
    end

    def zoom
      12
    end

  end
end
