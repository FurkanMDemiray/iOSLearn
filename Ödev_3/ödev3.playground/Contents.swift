import UIKit

// question 1

func printPlusAndMinus(_ num: Int) {
    for i in 0..<num {
        i % 2 == 0 ? print("+") : print("-")
    }
}

printPlusAndMinus(5)

// question two
func makeNumBigger(_ num: Int) -> String {
    var strNum = String(num)
    var strArray = [String]()

    for i in strNum {
        strArray.append(String(i))
    }
    var inserted = false
    for (index, i) in strArray.enumerated() {
        if Int(i)! < 5 && inserted == false {
            strArray.insert("5", at: index)
            inserted = true
        }
    }
    var res = ""
    for i in strArray {
        res += i
    }

    return res
}

print(makeNumBigger(554))



