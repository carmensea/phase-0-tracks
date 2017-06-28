#Dogs in a shelter

shelter = {
  dogs: {
    pitbull: ["Mark", "Mike", "Manny"],
    chihuahua: ["Togli", "Teddy", "Tina"],
    doberman: ["Andrew", "Anita", "Allison"]
  },
  cats: {
    yellow: ["Tabitha", "Troy"],
    brown: ["Bugs", "Ben"]
  },
  birds: {
    parrot: ["Penny"],
    parakeet: []
  }
}

shelter[:dogs][:pitbull].push("Marcy")
p shelter

shelter[:dogs][:doberman][1] = "Angela"
p shelter

shelter[:birds][:parrot].delete_at(0)
p shelter

shelter[:cats][:tabbies] = "Miranda"
p shelter
