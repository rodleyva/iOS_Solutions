import Foundation

// MARK: Heads or Tails

//1
let headsOrTails = ["Heads", "Tails"]

func tossCoin() -> String {
    print("Tossing Coin")
    let choice = headsOrTails[Int.random(in: 0...1)]
    print("Chose \(choice)")
    return choice
}

//2
func tossMultipleCoins(_ times: Int) -> Double{
    var headsTosses: Double = 0.0
    var tailsTosses: Double = 0.0
    
    for _ in 1...times{
        if tossCoin() == "Heads"{
            headsTosses += 1
        }else{
            tailsTosses += 1
        }
    }
    
    
    return headsTosses / Double(times)
}

print(tossMultipleCoins(500))
