require 'open-uri'
require 'json'

class EmailJob < ApplicationJob
  queue_as :default

  def perform()
    puts "Init Email Job..."
    url = URI.open('https://api.chucknorris.io/jokes/random').read
    json = JSON.parse(url)
    sleep 3
    email = Email.new(subject: "This is the most incredible Email", content: json['value'])
    email.save
    puts "Job Finished!"
  end
end
