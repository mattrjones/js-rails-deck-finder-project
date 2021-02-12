// JS file was required at bottom of HTML file so no need for DOMContentLoaded
const BASE_URL = "http://localhost:3000"
const DECKS_URL = `${BASE_URL}/decks`
const USERS_URL = `${BASE_URL}/users`
const FAVORITES_URL = `${BASE_URL}/favorites`
const deckCollection = document.querySelector('#deck-collection')
const favCollection = document.querySelector('#fav-collection')
const likeButton = document.querySelector('.like-btn')
const signupForm = document.querySelector('#signup-form')
const signupInputs = document.querySelectorAll(".signup-input")
const header = document.querySelector('.header-banner')
const logout = document.querySelector('.logout')
let currentUser

class Deck  {
    constructor(deckAttributes) {
        this.title = deckAttributes.title;
        this.price = deckAttributes.price;
        this.category = deckAttributes.category;
        this.description = deckAttributes.description;
        this.link = deckAttributes.link;
        this.image = deckAttributes.image;
        this.id = deckAttributes.id;
    }

    render() {
        return `<div class="card">
                  <h2>${this.title} ($${this.price})</h2>
                  <h4 class="deck-cat">${this.category}</h4>
                  <a href=${this.link} target="_blank"><img src=${this.image} class="deck-image" /></a>
                  <p>${this.description}<p>
                  <button data-deck-id=${this.id} class="like-btn">♡</button>
                </div>`
    }
}

function putDecksOnDom(deckArray){
    deckCollection.innerHTML = `<h2 class="subheader">All Deck Ideas</h2>
                                <h4 class="favorites-link">View My Favorites ♡</h4>`
    deckArray.forEach(deck => {
        deckCollection.innerHTML += new Deck(deck).render()

        // `<div class="card">
        //   <h2>${deck.title} ($${deck.price})</h2>
        //   <h4 class="deck-cat">${deck.category}</h4>
        //   <a href=${deck.link} target="_blank"><img src=${deck.image} class="deck-image" /></a>
        //   <p>${deck.description}<p>
        //   <button data-deck-id=${deck.id} class="like-btn">♡</button>
        // </div>`
    })
}

function putFavoritesOnDom(favArray){
    favCollection.innerHTML = `<h2 class="subheader">My Favorites</h2>
                               <h4 class="back-link">←Back to Decks</h4>`
    favArray.forEach(favorite => {
        favCollection.innerHTML += `<div class="card">
          <h2>${favorite.deck.title} ($${favorite.deck.price})</h2>
          <h4 class="deck-cat">${favorite.deck.category}</h4>
          <a href=${favorite.deck.link} target="_blank"><img src=${favorite.deck.image} class="deck-image" /></a>
          <p>${favorite.deck.description}<p>
          <button data-deck-id=${favorite.deck.id} class="like-btn" style="color:red;">♡</button>
          <button data-deck-id=${favorite.id} class="delete-fav-btn" onclick="deleteFav()">Delete Favorite</button>
        </div>`
    })
}

function deleteFav(){
    debugger;
    let favId = parseInt(event.target.dataset.deckId)

    fetch(BASE_URL + '/users/' + currentUser.id + '/favorites/' + favId, {
        method: 'DELETE'
    })
    
    fetchFavorites();
}

function fetchDecks(){
    fetch(DECKS_URL)
    .then(res => res.json())
    .then(decks => putDecksOnDom(decks))
}

function fetchFavorites(){
    fetch(BASE_URL + '/users/' + currentUser.id + '/favorites')
    .then(res => res.json())
    .then(favorites => putFavoritesOnDom(favorites))
}

signupForm.addEventListener('submit', function(e){
    e.preventDefault()
    fetch(USERS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            user: {
                email: signupInputs[0].value,
                password: signupInputs[1].value
            }
        })
    })
    .then(res => res.json())
    .then(function(object){
        if (object.message) {
            alert(object.message)
        }
        else {
        loggedInUser(object)
        }
    }
    )
})

deckCollection.addEventListener('click', function(e) {
    if (event.target.className == "favorites-link") {
        deckCollection.style.display = 'none';
        fetchFavorites();
        favCollection.style.display = 'initial';
    }
})

favCollection.addEventListener('click', function(e) {
    if (event.target.className == "back-link") {
        favCollection.style.display = 'none';
        deckCollection.style.display = 'initial';
    }
})

function loggedInUser(object){
    currentUser = object
    signupForm.style.display = 'none'
    welcome.innerHTML = `<h3>Hello, <i>${currentUser.email}</i> !</h3>`
    // logout.innerText = "Logout"
    fetchDecks()
}

deckCollection.addEventListener('click', function(e){
    // console.log(event.target.className, event.target.style.color)
    // e.preventDefault() was preventing images from being clickable
    if ((event.target.className == "like-btn") && (event.target.style.color !== 'red')) {
        let target = event.target
            fetch(FAVORITES_URL, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Accept: "application/json"
                },
                body: JSON.stringify({
                        user_id: `${currentUser.id}`,
                        deck_id: `${event.target.dataset.deckId}`
                })
        })
        .then( res => res.json())
        .then( res => target.dataset.favId = res.id);
        event.target.style.color = 'red';}
    else if ((event.target.className == "like-btn") && (event.target.style.color == 'red')) {
        event.target.style.color = 'black';
        fetch(FAVORITES_URL + '/' + event.target.dataset.favId, {
            method: "DELETE"
        })
    }
})
