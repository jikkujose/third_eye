module Main
  class WebappController < Volt::ModelController
    model :store

    def index
      reset_fields
    end

    def add_event
      _events.create({
        sender: page._sender,
        content: page._content,
        type: page._type,
        created_at: Time.now,
        location: page._location,
      })
        .then { |e| }
        .fail { |e| flash._errors << errors_for(e.keys) }

      reset_fields
    end

    def errors_for(array)
      p array
      p 'Seems there is a problem! Try checking: ' + array.map(&:capitalize).join(", ")
    end

    def reset_fields
      page._location = 'Technopark'
      page._type = "Accident"
      page._sender = ''
      page._content = ''
    end
  end
end

