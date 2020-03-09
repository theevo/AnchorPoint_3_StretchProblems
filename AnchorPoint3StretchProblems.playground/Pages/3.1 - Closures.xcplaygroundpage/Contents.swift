/*:
 # Monday Stretch Problem 3.1
 ## Closures
 
 ### Instructions:
 1. User filter to create an array that contains all the numbers that are multiples of 3 from the numbersArray. Print your result.
 2. Find the largest number from the previous number array and then print it. Use reduce to solve. Print your result.
 3. Join all the string objects in the stringsArray into one string using reduce. Make sure spaces are in between each string. Print your result.
 
 ### Black Diamond 💎💎💎
 In one line convert blackDiamondDictionary into a joined string describing Mama, Papa, and Baby bear's porridge temperature. CompactMap, Reduce, and anonymouse closure arguments will be your friend.
*/

import Foundation

var numbersArray = [11,24,45,44,59,43,88,93,58,11,13,14,15,190]
var stringsArray = ["I", "Love", "DevMountain"]
var blackDiamondDictionary = ["Mama" : "too cold", "Papa" : "too hot", "Baby" : "just right"]

let numbersDivBy3 = numbersArray.filter { x in
    x % 3 == 0
}

print(numbersDivBy3)

let highestInNumbers = numbersArray.reduce(0, { x, y in
    x > y ? x : y
} )

print(highestInNumbers)

let iLoveDevMtnString = stringsArray.reduce(into: "") {sentence, word in
    sentence += "\(word) "
}

print(iLoveDevMtnString)

let threeBearsString = blackDiamondDictionary.compactMap { bear, temp in
    "\(bear) bear's porridge was \(temp)"
}.reduce("") { paragraph, sentence in
    "\(paragraph)\n\(sentence)"
}

print(threeBearsString)

//: [Next](@next)
