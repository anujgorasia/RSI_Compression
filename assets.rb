def get_response(url1, url2)

  uri = URI.parse("#{url1}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  #puts "#{eval(response.body)}"
  body1 = eval(response.body)[:values][0..15] if !eval(response.body)[:values].nil? #16 days limit [8..22]
  #body1 = eval(response.body)[:values][0..30] if !eval(response.body)[:values].nil? and "#{@manifest["params"]["interval"]}" == "4h"


  uri = URI.parse("#{url2}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  body2 = eval(response.body)[:values][0..15] if !eval(response.body)[:values].nil? #16 days limit [8..22]
  #body2 = eval(response.body)[:values][0..30] if !eval(response.body)[:values].nil? and "#{@manifest["params"]["interval"]}" == "4h"

  if !body1.nil? and !body2.nil?
    for index in (0..body2.length-1)
      body2[index][:rsi] = body1[index][:rsi]#[0..6]
    end
  end

  return body2 if !body2.nil?
end


def get_relative_strength_index(response)

  relative_strength_index = []

  response.each do |element|
    relative_strength_index << element[:rsi]
  end

  return relative_strength_index
end
