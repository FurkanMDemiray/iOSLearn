import UIKit

// euler 8
var number = """
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
"""

// remove the new line character
number = number.replacingOccurrences(of: "\n", with: "")
var numArray = [Int]()

for i in number {
    numArray.append(Int(String(i))!)
}
var product = 1
var productArray = [Int]()
for i in 0..<numArray.count {
    var product = 1
    if i + 13 == 1000 { break }
    for j in i..<(i + 13) {
        product *= numArray[j]
    }
    //print(product)
    productArray.append(product)
}
productArray.max()

// euler 9

// a^2 + b^2 = c^2 == Kök(a^2 + b^2) = c

// a + b + c = 1000 == a + b + Kök(a^2 + b^2) = 1000

var pisagorTuple: (a: Int, b: Int, c: Int)?
var pisagorArray = [pisagorTuple]

for a in 100..<499 {
    for b in a + 1..<500 {
        let c = sqrt(Double((a * a) + (b * b)))
        let sum = Double(a) + Double(b) + c.rounded()
        if sum == 1000 {
            //print("a: \(a), b: \(b), c: \(c)")
            pisagorArray.append((a, b, Int(c)))
        }
    }
}
//pisagorArray

for i in pisagorArray {
    if let a = i?.a, let b = i?.b, let c = i?.c, a * a + b * b == c * c {
        print("a: \(a), b: \(b), c: \(c)")
        print(a * b * c)
    }
}

// euler 10
// sieve of eratosthenes
func sieveOfEratosthenes(n: Int) -> [Int] {
    var primeArray = [Bool](repeating: true, count: n + 1)
    var p = 2
    while p * p <= n {
        if primeArray[p] == true {
            for i in stride(from: p * p, to: n + 1, by: p) {
                primeArray[i] = false
            }
        }
        p += 1
    }
    var primeNumbers = [Int]()
    for i in 2...n {
        if primeArray[i] {
            primeNumbers.append(i)
        }
    }
    return primeNumbers
}

//let primeNumbers = sieveOfEratosthenes(n: 2000000)

// segmented sieve of eratosthenes

func segmentedSieveOfEratosthenes(n: Int) -> Int {
    let limit = Int(sqrt(Double(n))) + 1
    let primeNumbers = sieveOfEratosthenes(n: limit)
    var low = limit
    var high = 2 * limit
    var result = [Int]()
    var sum = 0
    while low < n {
        if high >= n {
            high = n
        }
        var segment = [Bool](repeating: true, count: limit + 1)
        for i in primeNumbers {
            var lowLimit = (low / i) * i
            if lowLimit < low {
                lowLimit += i
            }
            for j in stride(from: lowLimit, to: high, by: i) {
                segment[j - low] = false
            }
        }
        for i in low..<high {
            if segment[i - low] {
                //result.append(i)
                sum += i
            }
        }
        low += limit
        high += limit
    }
    return sum
}

print(segmentedSieveOfEratosthenes(n: 2000000))

// exercism difference of squares

/*class Squares {
    var number: Int

    init(number: Int) {
        self.number = number
    }
    var squareOfSum: Int {
        var sum = 0
        for i in 1...self.number {
            sum += i
        }
        return sum * sum
    }

    var sumOfSquares: Int {
        var sum = 0
        for i in 1...self.number {
            sum += i * i
        }
        return sum
    }

    var differenceOfSquares: Int {
        return self.squareOfSum - self.sumOfSquares
    }
}

Squares(number: 10).differenceOfSquares*/

/* log lines
enum LogLevel{
   case trace
    case debug
    case info
    case warning
    case error
    case fatal
    case unknown

    init(_ log : String){
       if log.contains("[TRC]"){self = .trace}
       else if log.contains("[DBG]"){self = .debug}
       else if log.contains("INF"){self = .info}
       else if log.contains("WRN"){self = .warning}
       else if log.contains("ERR"){self = .error}
       else if log.contains("FTL"){self = .fatal}
       else{self = .unknown}
    }

    func shortFormat(message: String) -> String{
       switch self{
         case .trace: return "0:\(message)"
         case .debug: return "1:\(message)"
         case .info: return "4:\(message)"
         case .warning: return "5:\(message)"
         case .error: return "6:\(message)"
         case .fatal: return "7:\(message)"
         case .unknown: return "42:\(message)"
       }
    }
}*/

/* windowing system

 struct Position{
    var x = 0
    var y = 0

     mutating func moveTo(newX: Int,newY: Int){
         self.x = newX
         self.y = newY
     }
 }
 // TODO: Define the Size struct
 struct Size{
    var width = 80
     var height = 60

     mutating func resize(newWidth: Int,newHeight: Int){
        self.width = newWidth
        self.height = newHeight
     }
 }
 // TODO: Define the Window class
 class Window{
    var title = "New Window"
     var screenSize = Size(width: 800, height: 600)
     var size = Size()
     var position = Position()
     var contents: String?

     func resize(to size: Size){
        self.size.width = min(max(1, size.width), screenSize.width - position.x)
         self.size.height = min(max(1, size.height), screenSize.height - position.y)
     }
      func move(to position: Position) {
         self.position.x = min(max(0, position.x), screenSize.width - size.width)
         self.position.y = min(max(0, position.y), screenSize.height - size.height)
     }
     func update(title: String){
        self.title = title
     }
     func update(text: String?){
        self.contents = text
     }
     func display() -> String{
          """
         \(title)
         Position: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))
         \(contents ?? "[This window intentionally left blank]")

         """
     }
 }

 let mainWindow: Window = {
     var window = Window()
     window.resize(to: Size(width: 400, height: 300))
     window.move(to: Position(x: 100, y: 100))
     window.update(title: "Main Window")
     window.update(text: "This is the main window")

     return window
 }()

 */

/* lasagna master

 // TODO: define the 'remainingMinutesInOven' function
 func remainingMinutesInOven(elapsedMinutes: Int,expectedMinutesInOven: Int = 40) -> Int{
      return expectedMinutesInOven - elapsedMinutes
 }

 // TODO: define the 'preparationTimeInMinutes' function
 func preparationTimeInMinutes(layers: String...) -> Int{
    return layers.count * 2
 }
 // TODO: define the 'quantities' function
 func quantities(layers: String...) ->(noodles: Int,sauce: Double){
     var noodlesCount = 0
     var sauceCount: Double = 0
     for i in layers{
       if i == "noodles"{ noodlesCount += 1}
       if i == "sauce" { sauceCount += 1}
     }
     return (noodles: noodlesCount * 3,sauce: sauceCount * 0.2)
 }
 // TODO: define the 'toOz' function
 func toOz(_ quantities: inout (noodles: Int, sauce: Double)) {
     quantities.sauce *= 33.814
 }
 // TODO: define the 'redWine' function
 func redWine(layers: String...) -> Bool{
    var whiteWineCount = 0
    var redWineCount = 0
     for i in layers{
        if i == "mozzarella" || i == "ricotta" || i == "béchamel" {whiteWineCount += 1}
        if i == "meat" || i == "sauce" {redWineCount += 1}
     }
     return redWineCount >= whiteWineCount
 }
 */

/* The 1st Rule of Poetry Club

 import Foundation

 func splitOnNewlines(_ poem: String) -> [String] {
     return poem.components(separatedBy: "\n")
 }

 func firstLetter(_ line: String) -> Character {
     var ch = [Character]()
     for i in line{
        ch.append(i)
     }
   return ch.first ?? "_"
 }

 func capitalize(_ phrase: String) -> String {
   return phrase.capitalized
 }

 func trimSentence(_ line: String) -> String {
   return line.trimmingCharacters(in: .whitespaces)
 }

 func lastLetter(_ line: String) -> Character {
   return line.last ?? "_"
 }

 func backDoorPassword(_ phrase: String) -> String {
     let word: String = capitalize(phrase)
     let polite: String = ", please"
     return word + polite
 }

 func ithLetter(_ line: String, i: Int) -> Character {
     if i > line.count{return " "}
   var index = line.index(line.startIndex, offsetBy: i)

     return line[index] ?? " "
 }

 func secretRoomPassword(_ phrase: String) -> String {
   return phrase.uppercased() + "!"
 }

 */

/* high score board

 func newScoreBoard() -> [String: Int] {
     var newHighScoreDict : [String: Int] = [:]
     return newHighScoreDict

   fatalError("newScoreBoard not implemented - please add implementation here")
 }

 func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
     var scoreTmp = scores
        scores[name, default: 0] = score

 }

 func removePlayer(_ scores: inout [String: Int], _ name: String) {
   scores[name] = nil
 }

 func resetScore(_ scores: inout [String: Int], _ name: String) {
   scores[name] = 0
 }

 func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
   if let currentScore = scores[name] {
         scores[name] = currentScore + delta
     } else {
         scores[name] = delta
     }
 }

 func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {

   var array = [(String,Int)]()
     for (name,score) in scores.sorted(by: <){
        array.append((name,score))
     }
   return array
 }

 func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
   var array = [(String,Int)]()
     for (name,score) in scores.sorted(by: { $0.value > $1.value }){
        array.append((name,score))
     }
   return array
 }
 */

/* Double-Null0111: Closures Are Forever

 let flip = {(x: (String,String,String)) -> (String,String,String) in
     var tuple = x
     var tmp = tuple.1
     tuple.1 = tuple.0
     tuple.0 = tmp
     return tuple
 }

 let rotate = {(x: (String,String,String)) -> (String,String,String) in
     var tuple: (String,String,String)
     tuple.0 = x.1
     tuple.1 = x.2
     tuple.2 = x.0
     return tuple
 }

 func makeShuffle(
     flipper: @escaping ((String, String, String)) -> (String, String, String),
     rotator: @escaping ((String, String, String)) -> (String, String, String)
 ) -> (UInt8, (String, String, String)) -> (String, String, String) {
     return { (num, wires) in
         var tmpWires = wires
         var id = num
         for _ in 0..<8 {
             let bit = id & 1 // Get the rightmost bit of the ID
             id >>= 1 // Shift ID to the right by one bit
             if bit == 1 {
                 tmpWires = rotator(tmpWires)
             } else {
                 tmpWires = flipper(tmpWires)
             }
         }
         return tmpWires
     }
 }

 */

/* master mixologist
 func timeToPrepare(drinks: [String]) -> Double {
     var time: Double = 0.0
     for x in drinks{
        if x == "beer" || x == "soda" || x == "water" {time += 0.5}
        if x == "shot" {time += 1.0}
        if x == "mixed drink" {time += 1.5}
        if x == "fancy drink" {time += 2.5}
        if x == "frozen drink" {time += 3.0}
     }
 return time
   fatalError("Please implement the timeToPrepare(drinks:) function")
 }

 func makeWedges(needed: Int, limes: [String]) -> Int {
     var count: Int = 0
     var tmp = needed
 if needed != 0 {
     for lime in limes {
        if lime == "small" {
         tmp -= 6
         count += 1
         }

        if lime == "medium" {tmp -= 8
                             count += 1}
        if lime == "large" {tmp -= 10
                            count += 1}
        if tmp <= 0 {break}
     }
 }
 return count
   fatalError("Please implement the makeWedges(needed:limes:) function")
 }

 func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
     var mL: Double  = Double(minutesLeft)
     var tmpArray = remainingOrders
     var indexList = [Int]()
     for (index,i) in tmpArray.enumerated() {
        mL -= timeToPrepare(drinks: i)
         indexList.append(index)
         if mL <= 0.0 {break}
     }

 tmpArray.removeSubrange(indexList[0]...indexList[indexList.count - 1])

    return tmpArray
   fatalError("Please implement the finishShift(minutesLeft:remainingOrders:) function")
 }

 func orderTracker(orders: [(drink: String, time: String)]) -> (

   beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
 ) {
 var beer: (String,String,Int)? = nil
     var soda: (String,String,Int)? = nil
     var beerCount: Int = 0
     var sodaCount: Int = 0

     for order in orders {
         if order.drink == "beer" {
             beerCount += 1
             if beer == nil {
                 beer = (order.time, order.time, 1)
             } else {
                 if order.time > beer!.1 { beer!.1 = order.time }
                 if order.time < beer!.0 { beer!.0 = order.time }
                 beer!.2 = beerCount
             }
         }
         if order.drink == "soda" {
             sodaCount += 1
             if soda == nil {
                 soda = (order.time, order.time, 1)
             } else {
                 if order.time > soda!.1 { soda!.1 = order.time }
                 if order.time < soda!.0 { soda!.0 = order.time }
                 soda!.2 = sodaCount
             }
         }
     }

     return (beer, soda)
   fatalError("Please implement the orderTracker(orders:) function")
 }
 */

/* Cal's Custom Sign Shop
 // TODO: define the 'birthday' String constant
 let birthday = "Birthday"
 // TODO: define the 'valentine' String constant
 let valentine = "Valentine's Day"
 // TODO: define the 'anniversary' String constant
 let anniversary = "Anniversary"
 // TODO: define the 'space' Character constant
 let space: Character = " "
 // TODO: define the 'exclamation' Character constant
 let exclamation: Character = "!"
 func buildSign(for occasion: String, name: String) -> String {
   //fatalError("Please implement the buildSign(for:name:) function")
     //if (occasion == birthday){return "Happy" + space + birthday + space + name}
     //if (occasion == valentine){return "Happy" + space + valentine + space + name}
     //if (occasion == anniversary){return "Happy" + space + anniversary + space + name}
     var tmp = "Happy"
     tmp.append(space)
     tmp.append(occasion)
     tmp.append(space)
     tmp.append(name)
     tmp.append(exclamation)
     return tmp
 }

 func graduationFor(name: String, year: Int) -> String {
   //fatalError("Please implement the graduationFor(name:year:) function")
     return "Congratulations " + name + "!" + "\nClass of \(year)"
 }

 func costOf(sign: String) -> Int {
   //fatalError("Please implement the costOf(sign:) function")


     return sign.count * 2 + 20
 }
 */

/*Freelancer Rates

 func dailyRateFrom(hourlyRate: Int) -> Double {
   //fatalError("Please implement the dailyRateFrom(hourlyRate:) function")
     return Double(hourlyRate) * 8.0
 }

 func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
   //fatalError("Please implement the monthlyRateFrom(hourlyRate:withDiscount:) function")
     let monthlyRate = dailyRateFrom(hourlyRate: hourlyRate) * 22
     let discountValue: Double = (Double(monthlyRate) * discount) / 100
     return (Double(monthlyRate) - discountValue).rounded()

 }

 func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
   //fatalError("Please implement the workdaysIn(budget:hourlyRate:withDiscount:) function")
    let dailyRate =  dailyRateFrom(hourlyRate: hourlyRate)
    let discountedDailyRate =  (Double(dailyRate) * discount) / 100
    let discountValue =  Double(dailyRate) - Double(discountedDailyRate)
    let result: Double = budget / Double(discountValue)

    return result.rounded(.down)

 }
 */
