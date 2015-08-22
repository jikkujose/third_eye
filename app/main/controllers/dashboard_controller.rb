module Main
  class DashboardController < Volt::ModelController
    def index
      page._default_address = 'Technopark, Trivandrum'
    end

    def markers
      # store._events.first.then {|e| e.location }
      store._events.then { |u| p u.map(&:location) }
    end

    def default_address
      'Technopark, Trivandrum'
    end

    def zoom
      12
    end
  end
end
