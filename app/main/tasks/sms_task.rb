class SMSTask < Volt::Task
  def reply(number)
    uri = URI('http://3g.ivisko.biz/httpapi/smsapi')

    parameters = {
      uname: 'qucentis',
      password: 'pass123',
      sender: 'THDREYE',
      receiver: number,
      route: 'T',
      msgtype: 1,
      sms: text
    }

    uri.query = URI.encode_www_form(parameters)

    p Net::HTTP.get_response(uri)
  end

  def text
    'Thanks for reporting to ThirdEye! We will look into it.'
  end
end
