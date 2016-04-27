User.destroy_all
Group.destroy_all
Game.destroy_all
Subscriber.destroy_all

u1 = User.create!(username: "Lolcats", email: "peter@peter.com", description: "le epic gamer", password: "password")
u1.user_image = Rails.root.join("app/assets/images/lolcats.jpg").open
u1.save

u2 = User.create!(username: "Doug the Pug", email: "peter@peter2.com", description: "goat", password: "password")
u2.user_image = Rails.root.join("app/assets/images/pug.gif").open
u2.save

u3 = User.create!(username: "Doggy", email: "peter@peter3.com", description: "goat3", password: "password")
u3.user_image = Rails.root.join("app/assets/images/pug-left.jpg").open
u3.save

g1 = Group.create!(name: "heythere", description: "we the greatest.", creator_id: u1.id)
g1.group_image = Rails.root.join("app/assets/images/fillmurray.jpg").open
g1.save

g1.games.create!(name: "Fifa 16", description: "You’ll have Confidence in Defending, take Control in Midfield, and you’ll produce more Moments of Magic than ever before. FIFA 16 – Play Beautiful.", image:"https://lh3.googleusercontent.com/Z6dvPMYXA-kPrzuWh1K3NMKCg6TXo7-d11XipaVg_RoUI4wquZje8QnLI589S5Eulg=w300")

Game.create!(name: "Destiny", description: "From the Creators of Halo and the company that brought you Call of Duty. In Destiny you are a Guardian of the last city on Earth, able to wield incredible power. Explore the ancient ruins of our solar system, from the red dunes of Mars to the lush jungles of Venus. Defeat Earth’s enemies. Reclaim all that we have lost. Become legend.", image:"https://www.destinythegame.com/content/dam/atvi/bungie/dtg-comet/wtb/destiny.jpg")

Subscriber.create!(group_id: g1.id, user_id: u1.id, admin: true)
Subscriber.create!(group_id: g1.id, user_id: u2.id, admin: false)
Subscriber.create!(group_id: g1.id, user_id: u3.id, admin: false)
