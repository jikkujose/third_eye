module Main
  class DashboardController < Volt::ModelController
    def index

      page._address = 'Kowdiar, Trivandrum'
      page._markers << "Medical College, Trivandrum"

    end
  end
end
