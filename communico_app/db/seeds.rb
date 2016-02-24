# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

master_user = User.create(
  first_name:  "master",
  last_name:   "user",
  email:       "master@user.com",
  username:    "masteruser",
  password:    "masteruser",
  password_confirmation: "masteruser"
)
