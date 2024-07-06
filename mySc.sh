#!/usr/bin/env swift
//print("Hello World")
import Foundation

var users = ["Feyyaz","süleyman","dogukan","Furkan"]

if users.contains(""){print("Empty name error") }
else{
for user in users{
   print(user.capitalized)	
 }
}


print("Enter your name: ")
var name = readLine(strippingNewline: true)

if let name = name {
  print("Hello \(name)") 
}
