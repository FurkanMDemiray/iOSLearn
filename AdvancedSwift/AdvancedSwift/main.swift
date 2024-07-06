//
//  main.swift
//  AdvancedSwift
//
//  Created by Melik Demiray on 6.12.2023.
//

import Foundation

let musicianClass = Musiciancs(name: "Furkan", age: 24, instrument: "Bağlama")



var musicianStruct = MusiciansStruct(name: "Aybüke", age: 24, Insturment: "Piano")

// class reference type olduğu için değişiklik yapabiliyoruz.

// struct value type olduğu için değişiklik yapamıyoruz.


print(musicianStruct.name)
print(musicianClass.name)

var copyMusician = musicianClass
var copyMusician2 = musicianStruct

copyMusician.name = "asdasd"
copyMusician2.name = "asdasd"

print("Struct", musicianStruct.name)
print("Class", musicianClass.name)

// Structlar daha hızlı çalışır. Çünkü value type olduğu için kopyalama yapmaz. Classlar Referans type olduğu için kopyalama yapar.



// Tuples


var tuple = (5, 10)

print(tuple.0)

var preDefinedTuple: (String, Int)

preDefinedTuple.0 = "asd"
preDefinedTuple.1 = 10

print(preDefinedTuple.self)

// switch case

let number = 10

switch number {
case 0:
    print("Number is 0")
case 10:
    print("Number is 10")
case 3...20:
    print("Number is between 3 and 20")
default:
    print("Number is unknown")
}


// protocol


protocol Running {
    func run()
}

class Person: Running {
    func run() {
        print("Person is running")
    }
}

class Animal {

}

class Dog: Animal, Running {
    func run() {
        print("Dog is running")
    }
}

struct Robot: Running {
    func run() {
        print("Robot is running")
    }
}

let person = Person()
let dog = Dog()
let robot = Robot()

let runningThings: [Running] = [person, dog, robot]

for thing in runningThings {
    thing.run()
}
