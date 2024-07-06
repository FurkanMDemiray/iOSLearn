import UIKit

var greeting = "Hello, playground"


// project euler 4

func isPalindRom(_ num: Int) -> Bool {
    var numStr = String(num)

    if numStr == String(numStr.reversed()) {
        return true
    }
    else {
        return false
    }
}

// abccba=100000×a+10000×b+1000×c+100×c+10×b+a=100001×a+10010×b+110×c=11×(9091×a+910×b+10×c)

func findLargestPalindrom() -> Int {
    var palindromArray = [Int]()

    for i in stride(from: 1000, to: 100, by: -1) {
        for j in stride(from: 990, to: 100, by: -11) {
            //print(i * j)
            if isPalindRom(i * j) { palindromArray.append(i * j) }
        }
    }
    return palindromArray.max()!
}
findLargestPalindrom()

// project eular 5

func checkNumIsDivisible(_ num: Int) -> Bool {
    var divisors = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11]

    for i in divisors {
        if num % i != 0 { return false }
    }
    return true
}

func divisibleNumber() {
    var i = 2520
    while !checkNumIsDivisible(i) {
        i += 2520
    }
    print(i)
}

divisibleNumber()

// project eular 6

func findDifferenceBetweenSquares() -> Int {

    var sumOfSquares = 0
    var squaresOfsum = 0

    for i in 1...100 {
        sumOfSquares += i * i
        squaresOfsum += i
    }

    return squaresOfsum * squaresOfsum - sumOfSquares
}
findDifferenceBetweenSquares()


// recursive prime number

func isPrime(_ number: Int, divisor: Int = 2) -> Bool {
    if number <= 1 {
        return false
    }

    if divisor * divisor > number {
        return true
    }

    if number % divisor == 0 {
        return false
    }

    return isPrime(number, divisor: divisor + 1)
}


struct Employee: Hashable {
    var name: String
}

let object1 = Employee(name: "Furkan")
let object2 = Employee(name: "Melik")

// print hash values
print(object1.hashValue)
print(object2.hashValue)


let tmp: (Int, Int) -> Int = { x, y in
    x + y
}

tmp(2,3)

let sum: (Int, Int) -> Int = {
    $0 + $1
}

sum(100,23)
