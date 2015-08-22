module Main
  class DashboardController < Volt::ModelController
    def index
    end

    def marker
      store._events.all.order(created_time)
    end

    def default_address
      "Technopark, Trivandrum"
    end

    def zoom
      12
    end

  end
end
