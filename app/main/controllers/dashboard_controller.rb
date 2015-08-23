module Main
  class DashboardController < Volt::ModelController
    def index
      page._address = default_address
      page._zoom = zoom
    end

    def locate(location)
      page._address = location
      page._zoom = 13
    end

    def filter_events(type)
      page._type = type
    end

    def markers
      store._events.where(type: 'accident').order(:created_at)
    end

    def default_address
      "Technopark, Trivandrum"
    end

    def zoom
      12
    end

  end
end
