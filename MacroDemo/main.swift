//
//  main.swift
//  MacroDemo
//
//  Created by Esraa Khaled   on 18/07/2023.
//

import Foundation
import Macros

@OptionSet<Int>
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

let a = Int.random(in: 0...5)
let b = 4
print(#stringify(a + b))

let expandedMacro = #stringify(Date())
print("Time Before sleeping: \(Date())")

if #available(macOS 13.0, *) {
    try! await Task.sleep(for: .seconds(2))
} else {
    // Fallback on earlier versions
}
print("Time After sleeping: \(Date())")
print(expandedMacro)

let maybeString = Bool.random() ? Bool.random() ? "Hello,world!" : "" : nil

func myFunction() {
    #bindIfNotEmpty(maybeString, {
        print(maybeString)
    })
}
myFunction()

@EnumTitle
enum FlightTicket{
    case economy
    case business
    case firstClass
}

@EnumTitle
enum Genre{
    case horror
    case comedy
    case kids
    case action
}

let swiftLeeBlogURL = #URL("https://www.avanderlee.com")
//

//let swiftLeeBlogURL = {
//    guard let swiftLeeBlogURL = URL(string: "https://www.avanderlee.com") else {
//        /// Throw compiler error
//    }
//    return swiftLeeBlogURL
//}()
