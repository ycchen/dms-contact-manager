# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!(email: "admin@test.com", password: "foobar1234", password_confirmation: "foobar1234", display_name: 'admin')
u.add_role "admin"

u2 = User.create!(email: "moderator@test.com", password: "foobar1234", password_confirmation: "foobar1234", display_name: 'moderator')
u2.add_role "moderator"

u3 = User.create!(email: "test@test.com", password: "foobar1234", password_confirmation: "foobar1234", display_name: 'user')
u3.add_role "user"

u4 = User.create!(email: "john.gaughan@dmsva.com", password: "test1234", password_confirmation: "test1234", display_name: 'John')
u4.add_role "user"

u5 = User.create!(email: "wayne.bushell@dmsva.com", password: "test1234", password_confirmation: "test1234", display_name: 'Wayne')
u5.add_role "user"
