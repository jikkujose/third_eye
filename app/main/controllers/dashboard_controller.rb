module Main
  class DashboardController < Volt::ModelController
    def index
    end

    def markers
      store._events.all.order(:created_at)
    end

    def default_address
      "Technopark, Trivandrum"
    end

    def zoom
      12
    end

  end
end
