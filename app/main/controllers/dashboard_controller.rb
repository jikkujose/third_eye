module Main
  class DashboardController < Volt::ModelController
    def index

      page._address = 'Kowdiar, Trivandrum'
      page._markers << "Kowdiar, Trivandrum"
      page._markers << "Thirumala, Trivandrum"

    end
  end
end
