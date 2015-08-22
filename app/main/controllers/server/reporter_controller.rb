module Main
  class ReporterController < Volt::HttpController
    def report_from_api
      message = request.body.read
      data = JSON.parse(message)
      store._events << Event.new(data)
      # store._spams << {name: 'Jikku', created_at: Time.now}
      render text: message
    end

    def recieve_from_sms
      data = { mobile: params._mobile, message: params._message }
      p data
      render text: 'Success!'
    end

    def reply_to_sms
      SMSTask.reply(params._mobile)
      render text: 'Seems its done!'
    end
  end
end
