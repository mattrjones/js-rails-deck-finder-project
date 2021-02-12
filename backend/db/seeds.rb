# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favorite.delete_all
Deck.delete_all
User.delete_all

decks =
         [{title: "Dimir Rogues", price: 175, description: "A UB aggro-control deck that aims to leverage your opponent's graveyard.", link: "https://www.mtggoldfish.com/archetype/standard-dimir-rogues-eld#paper", image: "https://cdn1.mtggoldfish.com/images/h/Soaring-Thought-Thief-ZNR-672.jpg", category:"Tempo"},
         {title: "Izzet Control", price: 243, description: "A UR control deck that uses cheap interaction in the form of counterspells and removal backed up by threats such as the new Goldspan Dragon to close out the game.", link: "https://www.mtggoldfish.com/archetype/standard-izzet-control-eld", image: "https://cdn1.mtggoldfish.com/images/h/Goldspan-Dragon-KHM-672.jpg", category:"Control"},
         {title: "Sultai Control", price: 294, description: "A UBG control deck that outgrinds the opponent with tools such as Binding of the old Gods and closes the game out with the extreme value offered by Yorion", link: "https://www.mtggoldfish.com/archetype/standard-sultai-control-eld", image: "https://cdn1.mtggoldfish.com/images/gf/Yorion%252C%2BSky%2BNomad%2B%253Cplaneswalker%2Bstamp%253E%2B%255BPIKO%255D.jpg",  category:"Control"},
         {title: "Rakdos Midrange", price: 232, description: "A BR midrange deck that prioritizes hand attack, removal, and hard-to-answer threats like the new Immersturm Predator", link: "https://www.mtggoldfish.com/archetype/standard-rakdos-midrange-eld-8969", image:"https://cdn1.mtggoldfish.com/images/h/Claim-the-Firstborn-ELD-672.jpg", category:"Midrange"},        
         {title: "Gruul Adventures", price: 282, description: "An aggressive deck that has surprising amounts of card advantage through adventure creatures and Edgewall Innkeeper", link: "https://www.mtggoldfish.com/archetype/standard-gruul-adventures-eld", image: "https://cdn1.mtggoldfish.com/images/h/Bonecrusher-Giant-ELD-672.jpg", category: "Aggro" },
         {title: "Boros Aggro", price: 146, description: "An aggressive deck featuring hard-to-answer threats and powerful finishers such as Embercleave.", link: "https://www.mtggoldfish.com/archetype/standard-boros-aggro-eld-8925", image: "https://cdn1.mtggoldfish.com/images/h/Seasoned-Hallowblade-M21-672.jpg", category: "Aggro"},
         {title: "Temur Ramp", price: 302, description: "A ramp deck that tries to get ahead on mana early and then cast game-ending threats like Genesis Ultimatum and Ugin, the Spirit Dragon ahead of schedule.", link: "https://www.mtggoldfish.com/archetype/standard-temur-ramp-eld", image: "https://cdn1.mtggoldfish.com/images/gf/Genesis%2BUltimatum%2B%253Cplaneswalker%2Bstamp%253E%2B%255BPIKO%255D.jpg", category: "Ramp"},
         {title: "Mono-Green Food", price: 234, description: "One of the most value-oriented decks in the meta, this deck utilizes the food-based value engine offered by trail of crumbs and the synergy that food has with Wicked Wold and Feasting Troll King. Not many decks can win the long game against the value that food generates.", link: "https://www.mtggoldfish.com/archetype/standard-mono-green-food-eld", image: "https://cdn1.mtggoldfish.com/images/h/Gilded-Goose-ELD-672.jpg", category: "Midrange" }
     ]

decks.each do |deck|
  Deck.create(deck)
end
