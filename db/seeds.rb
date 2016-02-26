User.destroy_all
Article.destroy_all
Subject.destroy_all

master_user = User.create(
  first_name:  "master",
  last_name:   "user",
  email:       "master@user.com",
  username:    "masteruser",
  password:    "masteruser",
  password_confirmation: "masteruser"
)

user_two = User.create(
  first_name:  "user",
  last_name:   "two",
  email:       "user@two.com",
  username:    "usertwo",
  password:    "usertwo",
  password_confirmation: "usertwo"
)
