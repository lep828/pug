User.destroy_all
Group.destroy_all
Game.destroy_all
Subscriber.destroy_all

u1 = User.create!(username: "peter", email: "peter@peter.com", image: "https://www.fillmurray.com/500/500", description: "le epic gamer", password: "password")

u2 = User.create!(username: "peter2", email: "peter@peter2.com", image: "https://www.fillmurray.com/450/450", description: "goat", password: "password")

u3 = User.create!(username: "peter3", email: "peter@peter3.com", image: "https://www.fillmurray.com/350/350", description: "goat3", password: "password")

g1 = Group.create!(name: "heythere", description: "we the greatest.", image: "https://www.fillmurray.com/300/300", creator_id: u1.id)

Subscriber.create!(group_id: g1.id, user_id: u1.id, admin: true)
Subscriber.create!(group_id: g1.id, user_id: u2.id, admin: false)
Subscriber.create!(group_id: g1.id, user_id: u3.id, admin: false)

game1 = Game.create!(name: "game1", description: "askdflasmdfk", image:"https://www.fillmurray.com/200/200")
