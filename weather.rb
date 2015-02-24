require "yahoo_weatherman"

def get_weather(zipcode)
    temp = zipcode.to_i
    client = Weatherman::Client.new
    temp = client.lookup_by_location(zipcode).condition[temp]
    return temp.to_i
end

def display_weather(temp)
    case temp
    when temp >= 75
        message = "It's hot out; drink lots of water to stay hydrated!"
    when temp >= 60 && temp < 75
        message = "I'd wear a jacket today and perhaps some sunglasses."
    when temp >= 50 && temp < 60
        message = "It's frappucino weather."
    when temp >= 30 && temp < 50 
        message = "Getting a bit chilly out there.  Where are your mittens?"
    when temp >= 15 && temp < 30
        message = "Calling all down parkas, please find your nearest owner."
    when temp >= 0 && temp < 15
        message = "Time to retire to the South."
    when temp < 0
        message = "Okay, what are you even doing outside?  Stay in with a blanket and someone to cuddle with."
    end 
end
          
puts "What is your zipcode?"
zipcode = gets

temp = get_weather(zipcode) 
gets temp.to_i

message = display_weather(temp)
puts message 





