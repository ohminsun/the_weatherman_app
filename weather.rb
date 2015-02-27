require "yahoo_weatherman"

def get_weather(zipcode)
    client = Weatherman::Client.new
    temp = client.lookup_by_location(zipcode).condition['temp']
    return temp.to_i
end

def display_weather(temp)
    if temp > 24
        message = "It's hot out; drink lots of water to stay hydrated!"
    elsif temp >= 16 && temp < 24
        message = "I'd wear a jacket today and perhaps some sunglasses."
    elsif temp >= 10 && temp < 16
        message = "It's frappucino weather."
    elsif temp >= 2 && temp < 10 
        message = "Getting a bit chilly out there.  Where are your mittens?"
    elsif temp >= 0 && temp < 2
        message = "Calling all down parkas, please find your nearest owner."
    elsif temp >= -5 && temp < 0
        message = "Time to retire to the South."
    elsif temp < -5
        message = "Okay, what are you even doing outside?  Stay in with a blanket and someone to cuddle with."
    else message = "I don't know what to recommend, sorry."
    end
end
          
puts "What is your zipcode?"
zipcode = gets

temp = get_weather(zipcode) 
gets temp.to_i

message = display_weather(temp)
puts message 
