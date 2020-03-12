//: [Previous](@previous)
/*:
 # Thursday Stretch Problem 3.4
 ## Making Change
 
 ### Instructions:
 Make a function that takes in a given amount of money (i.e. 2.15) and returns a string of the amount of dollars, quarters, dimes, nickels, and pennies needed to make that amount of money. Return something like: Your change is 1 quarter, 2 dimes, 0 nickels, and 1 penny.
 
 ### Black Diamond 💎💎💎
 Make a function that takes in the cost of an item, and the amount of money paid (i.e. cost: $2.15, amount paid: $5.00) and then returns a string detailing the amount of change in dollars, quarters, dimes, nickels, and pennies.
 
 When this works, try to recreate Swift's built-in filter function. Just like the Swift function, it should be generic and it should take a closure that returns a Bool, from which it determines how to filter your sequence type.
 */

import Foundation

enum Denominations: Float {
    case penny = 0.01
    case nickle = 0.05
    case dime = 0.1
    case quarter = 0.25
    case dollar = 1.00
}

func coinCounter(for amount: Float, coinValue: Float) -> (remainder: Float, coinCount: Float) {
    let coinQty = (amount / coinValue).rounded(.down)
    var remainder = amount.truncatingRemainder(dividingBy: coinValue)
    
    // === Special Case ===
    // after the nickles count is determined, pennies are next.
    // we must return an exact remainder (0.01 - 0.04) in order for the pennies call to complete successfully
    
    if coinValue == Denominations.nickle.rawValue {
        remainder = round(100*remainder)/100
        print(remainder)
    }
    return (remainder, coinQty)
}

func makeChange(for amount: Float) -> String {
    
    let dollars = coinCounter(for: amount, coinValue: Denominations.dollar.rawValue)
    let dollarQty = dollars.coinCount
    let coinAmount = dollars.remainder
    
    let quarters = coinCounter(for: coinAmount, coinValue: Denominations.quarter.rawValue)
    let quarterQty = quarters.coinCount
    let quarterRemainder = quarters.remainder
    
    let dimes = coinCounter(for: quarterRemainder, coinValue: Denominations.dime.rawValue)
    let dimeQty = dimes.coinCount
    let dimeRemainder = dimes.remainder
    
    let nickles = coinCounter(for: dimeRemainder, coinValue: Denominations.nickle.rawValue)
    let nickleQty = nickles.coinCount
    let nickleRemainder = nickles.remainder
    
    let pennies = coinCounter(for: nickleRemainder, coinValue: Denominations.penny.rawValue)
    let pennyQty = pennies.coinCount
    
    
    return """
    $\(amount) becomes...
    \t \(dollarQty) dollars
    \t \(quarterQty) quarters
    \t \(dimeQty) dimes
    \t \(nickleQty) nickles
    \t \(pennyQty) pennies
    """
}

//print(makeChange(for: 0.01))
//print(makeChange(for: 2.15))
print(makeChange(for: 2.51))
print(makeChange(for: 2.52))
print(makeChange(for: 212.59))
//: [Next](@next)
