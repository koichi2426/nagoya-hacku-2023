# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

msi = Mission.create([{title: 'MissionA', progress: 1}])

msi1 = Mission.find(1)
smsi = SubMission.create([{mission: msi1, content: 'Sub1'}])
smsi = SubMission.create([{mission: msi1, content: 'Sub2'}])
smsi = SubMission.create([{mission: msi1, content: 'Sub3'}])
smsi = SubMission.create([{mission: msi1, content: 'Sub4'}])
smsi = SubMission.create([{mission: msi1, content: 'Sub5'}])
