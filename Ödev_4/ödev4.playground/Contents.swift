import UIKit

//

func combine<T, U>(_ value1: T, _ value2: U) -> (T, U) {
    (value1, value2)
}

print(combine(5, ["furkan","melik"]))

extension Int {
    func isPrime() -> Bool {
        var n = self
        if n <= 1 {
            return false
        }
        if n <= 3 {
            return true
        }
        var i = 2
        while i * i <= n {
            if n % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
}

var i = 3
var primeCounter = 1
while true{
    i.isPrime() ? primeCounter += 1 : nil
    if primeCounter == 10001{break}
    //print(primeCounter)
    i += 2
}

print(i)


/* exercism pizza slices

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    
    if let diameter = diameter , let slices = slices,diameter >= 0,slices > 0 {
       
        var r = diameter / 2
       var size: Double = r * r * .pi
       var sliceSize: Double = size / Double(slices)
        return sliceSize
        
      
    }
    else {return nil }
    
  fatalError("Please implement the sliceSize(diameter:slices:) function")
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    
    if let _ = Double(diameterA), let sliceA = Int(slicesA), Double(diameterB) == nil || Int(slicesB) == nil{
        if sliceA < 0 {return "Neither slice is bigger"}
       else {return "Slice A is bigger"}
    }
if let _ = Double(diameterB), let _ = Int(slicesB), Double(diameterA) == nil || Int(slicesA) == nil{
       return "Slice B is bigger"
    }
if  Double(diameterB) == Double(diameterA) &&  Int(slicesB) == Int(slicesA) {return "Neither slice is bigger"}
    
    guard let diameterA = Double(diameterA), let slicesA = Int(slicesA),let diameterB = Double(diameterB), let slicesB = Int(slicesB) else {return "Neither slice is bigger"}
if (diameterA < 0 || slicesA < 0) && (diameterB > 0 && slicesB > 0) {return "Slice B is bigger"}
else if (diameterB < 0 || slicesB < 0) && (diameterA > 0 && slicesA > 0) {return "Slice A is bigger"}

    var rA = diameterA / 2
    var rB = diameterB / 2
    var fieldA: Double = rA * rA * .pi
    var fieldB: Double = rB * rB * .pi
    var sliceA = fieldA / Double(slicesA)
    var sliceB = fieldB / Double(slicesB)

    if sliceA > sliceB {return "Slice A is bigger"}
    else {return "Slice B is bigger"}
    if (diameterB == 0 && diameterA > 0) {return "Slice A is bigger"}
else {return "Slice B is bigger"}
    
  fatalError("Please implement the biggestSlice(diameterA:slicesA:diameterB:slicesB:) function")
}
*/

/* secret agent
 func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
     func secretFunc (_ i: String) -> String{
       if (i == password) {return secret}
         else {return "Sorry. No hidden secrets here."}
     }

     return secretFunc
   fatalError("Please implement the protectSecret(_:withPassword:) function")
 }

 func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
     let firstNumber = f(room)
     let secondNumber = f(firstNumber)
     let thirdNumber = f(secondNumber)
     
     return (firstNumber, secondNumber, thirdNumber)
   fatalError("Please implement the generateCombination(forRoom:usingFunction) function")
 }
 */

/* vehicle purchase
 func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
     let tmp: Double = monthlyBudget * 1.1
     var monthlyPrice: Double = price / 60
     if monthlyPrice <= monthlyBudget { return "Yes! I'm getting a \(vehicle)" }
     else if monthlyPrice <= tmp {return "I'll have to be frugal if I want a \(vehicle)"}
     else {return "Darn! No \(vehicle) for me"}
     
   fatalError("Please implement the canIBuy(vehicle:price:monthlyBudget:) function")
 }

 func licenseType(numberOfWheels wheels: Int) -> String {
     
     if wheels == 2 || wheels == 3 {return "You will need a motorcycle license for your vehicle"}
     else if wheels == 4 || wheels == 6 {return"You will need an automobile license for your vehicle"}
     else if wheels == 18 {return "You will need a commercial trucking license for your vehicle"}
     else {return "We do not issue licenses for those types of vehicles"}
   fatalError("Please implement licenseType(numberOfWheels:) function")
 }

 func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
     var price : Double
     if yearsOld < 3 { price = Double(originalPrice) * 0.8}
     else if yearsOld >= 10 {price = Double(originalPrice) * 0.5}
     else {price = Double(originalPrice) * 0.7}
     return Int(price)
   fatalError("Please implement calculateResellPrice(originalPrice:yearsOld:) function")
 }
 
 */

/* magician in training
 
 func getCard(at index: Int, from stack: [Int]) -> Int {

     return stack[index]
   fatalError("Please implement the getCard(at:from:) function")
 }

 func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
     var copyArray : [Int] = stack
     if index < copyArray.count && index >= 0 {
         copyArray[index] = newCard
         return copyArray
     }else
     {
          return stack
     }
   fatalError("Please implement the setCard(at:from:to:) function")
 }

 func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
     var copyArray : [Int] = stack
     copyArray.append(newCard)
     return copyArray
   fatalError("Please implement the insert(_:atTopOf:) function")
 }

 func removeCard(at index: Int, from stack: [Int]) -> [Int] {
     var copyArray : [Int] = stack
     if index < copyArray.count && index >= 0 {
         copyArray.remove(at: index)
         return copyArray
     }else {return stack}
    
     
   fatalError("Please implement the removeCard(at:from:) function")
 }

 func removeTopCard(_ stack: [Int]) -> [Int] {
     var copyArray = stack
     if copyArray.isEmpty == false {
        copyArray.remove(at: copyArray.count - 1)
         return copyArray
     }else {return stack}
   fatalError("Please implement the removeTopCard(_) function")
 }

 func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
     var copyArray = stack
     copyArray.insert(newCard , at: 0)
     return copyArray
   fatalError("Please implement the insert(_:atBottomOf:) function")
 }

 func removeBottomCard(_ stack: [Int]) -> [Int] {
      var copyArray = stack
     if copyArray.isEmpty == false {
         copyArray.remove(at: 0)
         return copyArray
     }else {return stack}
   fatalError("Please implement the removeBottomCard(_) function")
 }

 func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
     if stack.count == size {return true}
     else {return false}
   fatalError("Please implement the checkSizeOfStack(_:_:) function")
 }

 func evenCardCount(_ stack: [Int]) -> Int {
     var count: Int = 0
     for i in stack {
       if i % 2 == 0 {
          count += 1
       }
     }
     return count
   fatalError("Please implement the evenCardCount(_) function")
 }
 
 */


/* sansta's swifty helper
 import Foundation

 func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
     var x = cart.0
     var y = cart.1
     var r: Double = sqrt(pow(x,2) + pow(y,2))
     var phi: Double = atan2(y,x)
     var newTuple : (Double,Double) = (r,phi)
     return newTuple
   fatalError("Please implement the cartesianToPolar(_:) function.")
 }

 func combineRecords(
   production: (toy: String, id: Int, productLead: String),
   gifts: (Int, [String])
 ) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
     var newTuple: (Int,String,String,[String]) = (production.1, production.0, production.2, gifts.1)
     return newTuple
     
   fatalError("Please implement the combineRecords(production:gifts:) function.")
 }
 */
