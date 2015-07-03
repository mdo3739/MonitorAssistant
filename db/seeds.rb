5.times do 
  name = Faker::App.name
  Application.create!(
    name: name,
    url: "www.#{name}.com"
  )
end
events = []
5.times do
  events << Faker::Lorem.words(2).join(" ")
end
50.times do
  Event.create!(
    name: events.sample,
    application: Application.all.sample
  )
end

puts "#{Application.all.count} applications registered"
puts "#{Event.all.count} events created out of"
print "#{events.count} different type of events"