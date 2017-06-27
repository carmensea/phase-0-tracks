application = {
  name: "Carmen",
  address: "123 Wysteria Lane, San Francisco, CA 94131",
  email: "carmen@devbootcamp.com",
  phone: "555-123-4567",
  fav_blue: "indigo",
  wallpaper: "Abstract woodsy scenes (no squirrels)",
  ombre_is: "So last season"
}

application[:name] = "Mogli"
p application[:name]
p application[:address]


#DRIVER CODE

#to update address
application[:address] = "542 Browning Lane, SF, CA, 94132"

#adds new label and info
application[:hates_color] = "orange"

p application[:hates_color]

p application[:name] + application[:address]

p application


#Questions

#clears hash
application.clear

#returns if hash contains no key-value pairs
p application.empty?

