//
//  Animals_Solution.swift
//  
//
//  Created by Rodrigo Leyva on 11/29/21.
//
// MARK: Animals (Core)

import Foundation

class Animal {
    let name: String
    var health: Int
    
    init(name: String, health: Int = 100){
        self.name = name
        self.health = health
    }
    
    func displayHealth(){
        print(self.health)
    }
}

class Cat: Animal{
    
    init(name: String){
        super.init(name: name, health: 150)
    }
    
    func growl(){
        print("Rawr")
    }
    
    func running(){
        print("Running")
        self.health -= 10
    }
}



class Lion: Cat{
    
    override init(name: String){
        super.init(name: name)
        self.health = 200
    }
    
    override func growl() {
        print("ROAR!! I am the King of the Jungle")
    }
    
}

class Cheetah: Cat{
    override func running() {
        
        
        if self.health <= 0 {
            print("Cheetah cannot run needs more health")
        }else{
            print("Running Fast")
            self.health -= 50
        }
    }
    
    func sleep(){
        if self.health < 200{
            self.health += 50
        }
    }
    
}

let cheetah = Cheetah(name: "Sleek")

cheetah.running()
cheetah.running()
cheetah.running()
cheetah.running()

print(cheetah.health)

let lion = Lion(name: "Mustafa")

lion.running()
lion.running()
lion.running()

lion.growl()
