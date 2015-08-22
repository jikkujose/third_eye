module Main
  class DashboardController < Volt::ModelController
    def index

      page._address = 'Kowdiar, Trivandrum'
      page._markers << "Medical College, Trivandrum"
      # page._events = []
      populate_table
    end

    def populate_table
      %w[

      ].each do |name|
        page._events << {name: name, glyph: 'phone', location: random_location}
      end
      p page._events
    end

    def random_location
      %w[
      kowdiar
      kudappanakunnu
      thambanoor
      thirumala
      ].sample
    end

    def fire
      puts 'thats cool'
    end
  end
end
