//: Playground - noun: a place where people can play

import UIKit

enum Rank:Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
            
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
let king = Rank.King
let kingRawValue = king.rawValue

func compare(rank1:Rank, rank2:Rank) ->Rank{
    if(rank1.rawValue > rank2.rawValue){
        return rank1
    }
    return rank2
}


let hightestRank = compare(Rank.Ace, rank2: Rank.King)
hightestRank.simpleDescription()



enum Suit:Int {
    case Spades, Hearts, Diamonds, Clubs
    
    func color() ->String{
        switch self{
        case .Spades,.Clubs:
            return "black"
        case .Diamonds, .Hearts:
            return "red"
        }
    }
    
    func simpleDescription() -> String{
        switch self{
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        case .Hearts:
            return "hearts"
        case .Spades:
            return "spades"
        }
    }
}


let diamond = Suit.Diamonds
diamond.color()

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return " The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades =  Card(rank: .Three, suit: .Spades)
threeOfSpades.simpleDescription()



func generateDeck() -> [Card]
{
    let numberOfCardsPerSuit = 13
    var deck = [Card]()
    
    for index in 0..<52
    {
        let suit = Suit(rawValue: index / numberOfCardsPerSuit)
        let rank = Rank(rawValue: index % numberOfCardsPerSuit + 1)
        let card = Card(rank: rank!, suit: suit!)
        deck.append(card)
    }
    
    return deck
}

var deck = generateDeck()

for card in deck{
    print(card.simpleDescription())
}