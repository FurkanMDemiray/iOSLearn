import UIKit

var greeting = "Hello, playground"

let name = "Furkan"

name.count

var array = [20,24,433,2,4,5]

print(array)

// set

var ageSet: Set<Int> = []

var ageSet2 = Set(array)

// dictonary

let deviceces: [String:String] = [:]

func Print(name:String,age:Int)
{
    print(name , age)
    
}

Print(name:"Furkan",age:20)


func AddTwoNumber(num1:Int , to num2 : Int)->Int {
    
    return num1+num2
    
}

AddTwoNumber(num1: 20, to: 30)


if 3<5 {
    print("uç beşten büyük değildir")
    
}


for item in array{
    print(item)
}

for item in array where item == 5{
    print(item)
}

for i in 0..<25 {
    print(i)
}

for i in 0...25 {
    print(i)
}

func deneme(bunla num: Int , topla num2:Int) -> Int{
    return num + num2
}

deneme(bunla: 10, topla: 23)

enum Phone : String{
    case phon1 = "good"
    case phone2 = "bad"
}

func EnumDeneme(on phone : Phone){
    print(phone.rawValue)
}

EnumDeneme(on: .phone2)

array.sort()
if let oldestAge = array.last{
    print("The Oldest Age is \(oldestAge)")
}
else {
    print("There is no oldest age")
}

let oldestAge2 = array.last ?? 999

// guard statement
func GetOldestAge(){
    guard let oldestAge3 = array.last else{
        return
    }
    // code here
}

    

class Students{
    var name : String? // optional
    var age: Int
    
    init(name: String, age : Int){
        self.name = name
        self.age = age
    }
}

let student = Students(name: "Furkan", age: 20)

print(student.age ,student.name)

class Parent{
    var parentName : String
    
    init(parentName : String)
    {
        self.parentName = parentName
    }
}

class Child: Parent{

    
    
}


let c = Child(parentName: "Fako")

c.parentName

extension String{
    
    func removeWhiteSpaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

var str = "De n e m e"

print(str.removeWhiteSpaces())

print("Furkan")
