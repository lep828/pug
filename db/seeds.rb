User.destroy_all
Group.destroy_all
Subscriber.destroy_all

g1 = Group.create!(name: "hey", description: "we the greatest.", image: "https://www.fillmurray.com/300/300")

u1 = User.create!(username: "peter", email: "peter@peter.com", image: "https://www.fillmurray.com/500/500", description: "le epic gamer", password: "password")

u2 = User.create!(username: "peter2", email: "peter@peter2.com", image: "https://www.fillmurray.com/450/450", description: "goat", password: "password")