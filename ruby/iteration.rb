people = ["Amy", "Claire", "Tom", "Mogli"]
  
people.each { |name| puts "Are you here #{name}?"}

people.map! do |x|
 puts x.upcase
end

tom = { 
  name:  "Tom",
  age: "27",
  hair: "Brown"
}
  
tom.each do |key, value| 
  p tom[:name]
end



