User.destroy_all
Group.destroy_all
Game.destroy_all
Subscriber.destroy_all

u1 = User.create!(username: "Lolcats", email: "peter@peter.com", description: "Just a guy that plays games and codes a bit.", password: "password")
u1.user_image = Rails.root.join("app/assets/images/lolcats.jpg").open
u1.save

u2 = User.create!(username: "Doug the Pug", email: "peter@peter2.com", description: "I didn't choose the Pug Life, the Pug Life chose me.", password: "password")
u2.user_image = Rails.root.join("app/assets/images/doug.jpg").open
u2.save

u3 = User.create!(username: "Doggy", email: "peter@peter3.com", description: "Such good, Much Meme, Very Epic.", password: "password")
u3.user_image = Rails.root.join("app/assets/images/doge.png").open
u3.save

u4 = User.create!(username: "Stock Guy", email: "stock@stock.com", description: "The original Stock master.", password: "password")
u4.user_image = Rails.root.join("app/assets/images/stock-guy.jpg").open
u4.save

u5 = User.create!(username: "Stock Girl", email: "stock@stock1.com", description: "Stock text goes here.", password: "password")
u5.user_image = Rails.root.join("app/assets/images/stock-girl.jpg").open
u5.save

u6 = User.create!(username: "Stock Boy", email: "stock@stock2.com", description: "Different stock text goes here.", password: "password")
u6.user_image = Rails.root.join("app/assets/images/stock-boy.jpg").open
u6.save


g1 = Group.create!(name: "Memers not Dreamers", description: "We made it.", creator_id: u1.id)
g1.group_image = Rails.root.join("app/assets/images/fillmurray.jpg").open
g1.save

g2 = Group.create!(name: "Disgusted Strategy", description: "RTS games are life, except Street Fighter thats good too.", creator_id: u3.id)
g2.group_image = Rails.root.join("app/assets/images/rts.png").open
g2.save

g3 = Group.create!(name: "Stock Corp", description: "We only accept stock people.", creator_id: u4.id)
g3.group_image = Rails.root.join("app/assets/images/stock-group.jpg").open
g3.save


g1.games.create!(name: "Fifa 16", description: "FIFA 16 innovates across the entire pitch to deliver a balanced, authentic, and exciting football experience that lets you play your way, and compete at a higher level. You’ll have Confidence in Defending, take Control in Midfield, and you’ll produce more Moments of Magic than ever before. FIFA 16 – Play Beautiful.", image:"https://lh3.googleusercontent.com/Z6dvPMYXA-kPrzuWh1K3NMKCg6TXo7-d11XipaVg_RoUI4wquZje8QnLI589S5Eulg=w300")

g1.games.create!(name: "Destiny", description: "From the Creators of Halo and the company that brought you Call of Duty. In Destiny you are a Guardian of the last city on Earth, able to wield incredible power. Explore the ancient ruins ourf our solar system, from the red dunes of Mars to the lush jungles of Venus. Defeat Earth’s enemies. Reclaim all that we have lost. Become legend.", image:"https://www.destinythegame.com/content/dam/atvi/bungie/dtg-comet/wtb/destiny.jpg")

g3.games.create!(name: "Call of Duty: Black Ops 3", description: "Call of Duty: Black Ops 3 deploys players into a dark, twisted future where a new breed of Black Ops soldiers emerges and the lines are blurred between our own humanity and the technology we created to stay ahead, in a world where cutting-edge military robotics define warfare.", image:"https://store.playstation.com/store/api/chihiro/00_09_000/container/GB/en/999/EP0002-CUSA02624_00-BLACKOPS3PREBASE/1461335328000/image?_version=00_09_000&platform=chihiro&w=225&h=225&bg_color=000000&opacity=100")

g2.games.create!(name: "Street Fighter 5", description: "The legendary fighting franchise returns with STREET FIGHTER® V! Stunning visuals depict the next generation of World Warriors in unprecedented detail, while exciting and accessible battle mechanics deliver endless fighting fun that both beginners and veterans can enjoy.", image: "https://upload.wikimedia.org/wikipedia/en/8/80/Street_Fighter_V_box_artwork.png")

g2.games.create!(name: "Starcraft 2", description: "In typical real-time strategy games, players build armies and vie for control of the battlefield. The armies in play can be as small as a single squad of Marines or as large as a full-blown planetary invasion force. As commander, you observe the battlefield from a top-down perspective and issue orders to your units in real time. Strategic thinking is key to success; you need to gather information about your opponents, anticipate their moves, outflank their attacks, and formulate a winning strategy.", image: "http://static.mnium.org/images/contenu/actus/sc2/mini_logo_starcraft2_sc2.png")


Subscriber.create!(group_id: g1.id, user_id: u1.id, admin: true)
Subscriber.create!(group_id: g1.id, user_id: u2.id, admin: false)
Subscriber.create!(group_id: g1.id, user_id: u3.id, admin: false)

Subscriber.create!(group_id: g2.id, user_id: u3.id, admin: true)
Subscriber.create!(group_id: g2.id, user_id: u6.id, admin: false)
Subscriber.create!(group_id: g2.id, user_id: u1.id, admin: false)

Subscriber.create!(group_id: g3.id, user_id: u4.id, admin: true)
Subscriber.create!(group_id: g3.id, user_id: u5.id, admin: false)
Subscriber.create!(group_id: g3.id, user_id: u6.id, admin: false)
