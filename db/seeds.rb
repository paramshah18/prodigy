# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

activities = [
  { title: "Advanced Mobility exercises", category: "Athleticism", frequency: "Maximize", duration: "Max" },
  { title: "Knowledge Boosters", category: "Boosters", frequency: "2x/Day", duration: "30 sec" },
  { title: "Visual Solfege", category: "Music", frequency: "1x/Day", duration: "30 sec" },
  { title: "Auditory Memory (Song 2)", category: "Memory", frequency: "1x/Day", duration: "30 sec" },
  { title: "Auditory Magic (Set 2)", category: "Creativity", frequency: "2 sounds/Day", duration: "60 sec" },
  { title: "Talk, To Listen", category: "Languages", frequency: "1x/Day", duration: "60 sec" },
  { title: "Finger Skills", category: "Athleticism", frequency: "3x/Week", duration: "60 sec" },
  { title: "Stimulus Explosion", category: "Creativity", frequency: "2x/Week", duration: "60 sec" },
  { title: "Foundations of Logic", category: "Logic", frequency: "2x/Week", duration: "60 sec" }
]

activities.each_with_index do |data, i|
  activity = Activity.create!(data)
  
  (14..20).each do |day|
    ProgramDay.create!(activity: activity, day: day) if [true, false].sample
  end
end
