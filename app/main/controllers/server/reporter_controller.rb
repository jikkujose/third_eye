module Main
  class ReporterController < Volt::HttpController
    SMS_FORMAT = /SOS\s+(?<location>.*?)\s+(?<content>.*)/

    def report_from_api
      message = request.body.read
      data = JSON.parse(message)
      store._events << Event.new(data)
      # store._spams << {name: 'Jikku', created_at: Time.now}
      render text: message
    end

    def recieve_from_sms
      content = extract_content(params._message)
      location = extract_location(params._message)

      return if content.nil? || location.nil?

      data = {
        mobile: params._mobile,
        content: content,
        location: location,
        created_at: Time.now,
        type: 'sos',
        sender: 'Mobile'
      }
      p data
      store._events << data

      SMSTask.reply(params._mobile)

      render text: 'Success!'
    end

    def reply_to_sms
      SMSTask.reply(params._mobile)
      render text: 'Seems its done!'
    end

    def extract_location(message)
      return unless message =~ SMS_FORMAT

      message.match(SMS_FORMAT) do |m|
        m[:location]
      end
    end

    def extract_content(message)
      return unless message =~ SMS_FORMAT

      message.match(SMS_FORMAT) do |m|
        m[:content]
      end
    end

    def create_event
      store._events.create({
        sender: params._sender,
        content: params._content,
        created_at: Time.now,
        type: params._type,
        location: params._location,
        mobile: params._mobile,
      })


      p params._name
      render text: 'Hey'
    end
  end
end
