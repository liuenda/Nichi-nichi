require 'unirest'
require_relative 'config'

def quip_edit(content)
  if defined? ACCESS_TOKEN == nil || ACCESS_TOKEN.nil? || ACCESS_TOKEN.empty?
    puts "ACCESS_TOKEN undefined"
    return
  else
    token = ACCESS_TOKEN
  end
  response = Unirest.post EDIT_URL,
                          headers: { "Authorization" => "Bearer " + ACCESS_TOKEN },
                          parameters:{ "thread_id" => THREAD_ID,
                                       "content" => content}
  unless response.code == 200
    raise Exception.new("request error")
  end

  puts "Successfully saved to Quip"
end
