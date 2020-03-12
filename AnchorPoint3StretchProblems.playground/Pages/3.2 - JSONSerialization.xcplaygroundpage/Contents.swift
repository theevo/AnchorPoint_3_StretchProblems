//: [Previous](@previous)

/*:
 # Tuesday Stretch Problem 3.2
 ## JSONSerialization
 
 ### Instructions:
 * Create a person class with four properties: **name**, **age**, **hasLice**, and **siblingNames**. Choose the correct types for each.
 * Make a failable initializer that takes in a dictionary of type String : Any.
 * Test this initializer on the *testDictionary* to make sure it works.
 
 ### Instructions continued
 * Read about [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
 * Use a Do/Try/Catch to do the following steps:
    * Use the JSONSerialization class to deserialize the *data* using the jsonObject function.
    * Cast the result of the jsonObject function into a [String: Any] dictionary and use it to initialize a Person
 */

import UIKit

let testDictionary: [String: Any] = ["name":"Derek","age":28,"hasLice":false,"timeSinceBirth":28.2345,"siblingNames":["Eve","Harmon","Gerald","Marty"]]

let jsonString = """

{

"name": "Derek",

"age": 28,

"hasLice": false,

"timeSinceBirth": 28.2345,

"siblingNames": ["Eve","Harmon","Gerald","Marty"]

}

"""

let data = jsonString.data(using: .utf8, allowLossyConversion: false)!

class Person {
    let name: String
    let age: Int
    let hasLice: Bool
    let siblingNames: [String]
    
    init?(dictionary: [String:Any]){
        guard let name = dictionary["name"] as? String,
            let age = dictionary["age"] as? Int,
            let hasLice = dictionary["hasLice"] as? Bool,
            let siblings = dictionary["siblingNames"] as? [String]
            else { return nil }
        
        self.name = name
        self.age = age
        self.hasLice = hasLice
        self.siblingNames = siblings
    }
}

if let bigd = Person(dictionary: testDictionary) {
    print(bigd.hasLice)
    print(bigd.siblingNames)
}

do {
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { fatalError() }
    if let heavyd = Person(dictionary: dictionary) {
        print("=== JSON unwrapped with serialization! ===")
        print(heavyd.name)
        print(heavyd.age)
        print(heavyd.hasLice)
        print(heavyd.siblingNames)
    }
} catch  {
    print(error, error.localizedDescription)
}
//: [Next](@next)
