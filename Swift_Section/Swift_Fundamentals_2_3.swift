//
//  Swift_Fundamentals_2_3.swift
//  
//
//  Created by Rodrigo Leyva on 11/27/21.
//

import Foundation

// MARK: Swift Fundamentals 2

//1.

for i in 1...255{
    print(i)
}


//2.
for i in 1...100{
    if i%3 == 0 && i%5 == 0 {
        continue
    }else if i%3 == 0 || i%5 == 0{
        print(i)
    }
}

//3
for i in 1...100{
    if i%3 == 0 && i%5 == 0{
        print("\(i) FizzBuzz")
    }else if i%3 == 0 {
        print("\(i) Fizz")
    } else if i%5 == 0{
        print("\(i) Buzz")
    }
}


// MARK: Swift Fundamentals 3

//1
var anArr: [Int] = []

for i in 1...255{
    anArr.append(i)
}

//2
anArr.swapAt(Int.random(in: 0..<255), Int.random(in: 0..<255))

//3
for _ in 1...100{
    anArr.swapAt(Int.random(in: 0..<255), Int.random(in: 0..<255))
}

//4
var indexToRemove: Int = 0
for i in 0..<anArr.count{
    if anArr[i] == 42{
        indexToRemove = i
    }
}

print(anArr.remove(at: indexToRemove))
print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(indexToRemove)")
