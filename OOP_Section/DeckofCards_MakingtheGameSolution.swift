//
//  DeckofCards_MakingtheGameSolution.swift
//  
//
//  Created by Rodrigo Leyva on 11/28/21.
//

import Foundation

// MARK: Deck of Cards

enum Colors{
    case red
    case blue
    case green
}

struct Card{
    let color: Colors
    let roll: Int
    
    init(color: Colors){
        
        self.color = color
        
        switch color{

        case .red:
            self.roll = Int.random(in: 1...2)
        case .blue:
            self.roll = Int.random(in: 3...4)
        case .green:
            self.roll = Int.random(in: 4...6)
        }
        
    }
}




class Deck{
    var cards: [Card] = []
    
    init(){
        for _ in 1...10{
            let blueCards = Card(color: .blue)
            let greenCards = Card(color: .green)
            let redCards = Card(color: .red)


            self.cards.append(blueCards)
            self.cards.append(greenCards)
            self.cards.append(redCards)

        }
    }
    
    func deal() -> Card {
        return self.cards.removeLast()
    }
    
    func isEmpty() -> Bool{
        return self.cards.isEmpty
    }
    
    func shuffle(){
        self.cards.shuffle()
    }
    
    
}



class Player{
    let name: String
    var hand: [Card]
    var coins: Int = 0
    
    init(name: String, hand: [Card]){
        self.name = name
        self.hand = hand
    }
    
    func draw(deck: Deck) -> Card{
        let chosenCard = deck.deal()
        self.hand.append(chosenCard)
        return chosenCard
    }
    
    func rollDice() -> Int{
        return Int.random(in: 1...6)
    }
    
    func matchingCards(color: Colors, num: Int) -> Int{
        var count: Int = 0
        
        for card in self.hand{
            if card.color == color && card.roll == num{
                count += 1
            }
        }
        return count
    }
}



// MARK: Making the Game (Optional)

class Game{
    let players: [Player]
    let deck: Deck
    var turnIdx: Int
    
    init(deck: Deck){
        self.players = [Player(name: "Mike", hand: []),
                        Player(name: "Sydney", hand: []),
                        Player(name: "Blake", hand: []),
                        Player(name: "Tiff", hand: [])]
        self.deck = deck
        self.turnIdx = 0
    }
    
    func playGame(){
        
        while !self.deck.isEmpty(){
            
            if self.turnIdx >= 4{
                self.turnIdx = 0
            }
            self.takeTurn(player: self.players[turnIdx])
            turnIdx += 1
        }
        self.announceWinner()
    }
    
    
    func takeTurn(player: Player){
        let roll = player.rollDice()
        
        player.coins += 2 * player.matchingCards(color: .green, num: roll)
        
        for p in self.players {
            p.coins += p.matchingCards(color: .blue, num: roll)
        }
        
        for p in self.players{
            if p.name != player.name && player.coins != 0{
                let match = p.matchingCards(color: .red, num: roll)
                player.coins -= match
                p.coins += match
            }
            
        }
        
        player.draw(deck: self.deck)
                
    }
    
    func announceWinner(){
        if let winner: Player = self.players.max(by: {$0.coins < $1.coins}){
            print(winner.name)
        }
    }
}

let deck = Deck()
let game = Game(deck: deck)

game.playGame()
