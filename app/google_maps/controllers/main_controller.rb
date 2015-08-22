if RUBY_PLATFORM == 'opal'
  require 'native'
end

module GoogleMaps
  class MainController < Volt::ModelController
    attr_accessor :section

    def index_ready
      @markers = []

      `this.geocoder = new google.maps.Geocoder();`

      node = section.container_node

      if attrs.respond_to?(:center)
        geocode(attrs.center) do |latlng|
          setup_map(node, latlng.to_n)
        end
      else
        setup_map(node, {lat: -34.397, lng: 150.644}.to_n)
      end
    end


    def before_index_remove
      %x{
        delete this.map;
        delete this.geocoder;
      }

      @add_listener.remove if @add_listener
      @remove_listener.remove if @remove_listener
    end

    def set_markers
      -> do
        store._events.all.then do |events|
          events.each do |event|
            add_marker(event.location) do |result|
              @markers << result
            end
          end
        end

        @add_listener.remove if @add_listener
        @remove_listener.remove if @remove_listener

        @add_listener = store._events.on('added') do |index|
          store._events[index].location.then do |location|
            add_marker(location) do |result|
              @markers[index] = result
            end
          end
        end

        @remove_listener = store._events.on('removed') do |index|
          marker = @markers.delete_at(index)
          remove_marker(marker.to_n)
        end

      end.watch!
    end

    def setup_zoom
      puts "SETUP ZOOM"
      `google.maps.event.addListener(self.map, 'zoom_changed', function() {
          var zoomLevel = self.map.getZoom();`

      @changing_zoom = true
      new_zoom = Native(`zoomLevel`)
      if attrs.zoom != new_zoom && attrs.respond_to?(:zoom=)
        attrs.zoom = new_zoom
      end

      # Setup listener again
      set_zoom

      @changing_zoom = false

      `});`

    end

    def set_zoom
      -> do
        attrs.zoom
        puts "SET ZOOM"
        unless @changing_zoom
          level = attrs.zoom
          if level.blank?
            level = 8
          else
            level = (level || 8).to_i
          end

          level_n = level.to_n
          `if (self.map.getZoom() != level_n) {`
          `self.map.setZoom(level_n);`
          `}`
        end
      end.watch!
    end

    def setup_map(node, latlng)
      %x{
        var mapOptions = {
          center: latlng,
          zoom: 8
        };
        this.map = new google.maps.Map($(node).find('.google-map-instance').get(0), mapOptions);
        console.log('map setup');
      }

      if attrs.respond_to?(:center)
        @first = true
        -> { set_center(attrs.center) }.watch!
      end


      set_zoom if attrs.respond_to?(:zoom)

      set_markers if attrs.respond_to?(:markers)

      setup_zoom if attrs.respond_to?(:zoom=)
    end

    def set_center(address)
      if @first
        @first = false
      else
        geocode(address) do |latlng|
          latlng_n = latlng.to_n
          `self.map.setCenter(latlng_n);`
        end
      end
    end

    def geocode(address)
      unless address.is_a?(String)
        yield({lat: -34.397, lng: 150.644})
        return
      end

      `this.geocoder.geocode( { 'address': address}, function(results, status) {`
      `if (status == google.maps.GeocoderStatus.OK) {`
      `var latlng = results[0].geometry.location;`
      yield(Native(`latlng`))
      `} else {`
      yield({lat: -34.397, lng: 150.644})
      `}`
      `}.bind(this));`

    end

    def add_marker(marker_data)
      address = marker_data.location
      content = marker_data.location
      icon = marker_data.glyph

      geocode(address) do |latlng|
        latlng_n = latlng.to_n
        marker = nil

        %x{
          marker = new google.maps.Marker({
            position: latlng_n,
            animation : google.maps.Animation.DROP,
            map: self.map,
            title: content
          });
        }

        yield Native(marker)
      end
    end

    def remove_marker(marker)
      `marker.setMap(null);`
    end
  end
end
