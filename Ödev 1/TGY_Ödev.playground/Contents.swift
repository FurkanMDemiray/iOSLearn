import UIKit

// soru 1
func removeRepeatedChars(str: String, numOfRepeat: Int) {
    var arrayUnique = [String]()
    var numArray = [Int]()

    for ch in str {
        print(ch)
        if !arrayUnique.contains(String(ch)) && ch != " " {
            arrayUnique.append(String(ch))
        }
    }

    for i in 0..<arrayUnique.count {
        var count = 0
        for j in str {
            if arrayUnique[i] == String(j) {
                count += 1
            }
        }
        numArray.append(count)
    }

    print(arrayUnique)
    print(numArray)

    let dict = Dictionary(uniqueKeysWithValues: zip(arrayUnique, numArray))

    var repeatedArray = [String]()
    for (value, key) in dict {
        if key >= numOfRepeat {
            print(value)
            repeatedArray.append(value)
        }
    }
    var tmp = str
    for i in tmp {
        if repeatedArray.contains(String(i)) {
            tmp.remove(at: tmp.firstIndex(of: i)!)
        }
    }
    tmp.first == " " ? tmp.removeFirst() : nil

    print(tmp)
}

removeRepeatedChars(str: "aaba kouq bux", numOfRepeat: 2)

// soru 2

func numOfRepeatedWords(str: String) {
    let words = str.lowercased().split(separator: " ")
    var arrayUnique = [String]()
    var numArray = [Int]()
    
    for i in 0..<words.count {
        if !arrayUnique.contains(String(words[i])) { arrayUnique.append(String(words[i])) }
    }

    for i in 0..<arrayUnique.count {
        var count = 0
        for j in 0..<words.count {
            if arrayUnique[i] == String(words[j]) {
                count += 1
            }
        }
        numArray.append(count)
    }
    //print(numArray)
    //print(array)
    
    let dict = Dictionary(uniqueKeysWithValues: zip(arrayUnique, numArray))
    print(dict)
}

numOfRepeatedWords(str: "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim merhaba")

// soru 3

func script() {

    var users = ["Feyyaz", "süleyman", "dogukan", "Furkan", "Ayşe", "Zeki", "kerim"]

    var res = [String]()
    if users.contains("") { print("Empty name error") }
    else {
        for user in users {
            res.append(user.uppercased())
        }
    }

    res = res.sorted()
    res = res.reversed()
    print(res)
}

script()

// project euler 1

func sumOf3And5() -> Int {
    var sum = 0
    for i in 1..<100 {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i
        }
    }
    return sum
}

print(sumOf3And5())

// project euler 2


func sumOfEvenValues() -> Int {
    var sum = 0
    var fibArray = [Int]()

    var head = 1
    var tail = 1
    var tmp = 1

    repeat {
        fibArray.append(head)
        tmp = head
        head = head + tail
        tail = tmp
    }
    while head <= 4000000

    for i in fibArray {
        if i % 2 == 0 {
            sum += i
        }
    }
    return sum
}

print(sumOfEvenValues())


// project euler 3

func isPrime(num: Int) -> Bool {
    var n = num
    if n <= 1 {
        return false
    }
     
    var i = 2
    while i <= n/i {
        if n % i == 0 {
            return false
        }
        i += 1
    }
     
    return true
}

func getBiggestPrimeNum(num: Int) {

    var multiplierArray = [Int]()
    var divider = 1
    var primeArray = [Int]()
    var n = num
    if isPrime(num: num) {
        print(num)
    }
    else {
        repeat {
            divider += 2
            if n % divider == 0{
                multiplierArray.append(divider)
                n /= divider
            }
        }
        while divider < n

        for i in multiplierArray {
            if isPrime(num: i) {
                primeArray.append(i)
            }
        }
        print(primeArray.max()!)
    }
}

getBiggestPrimeNum(num: 600851475143)




