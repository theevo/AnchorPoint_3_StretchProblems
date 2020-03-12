//: [Previous](@previous)

/*:
 # Wednesday Stretch Problem 3.3
 ## JSONSerialization
 
 ### Instructions:
 *The solution from JSONSerialization (3.2) is the starting code for this stretch problem*
 * Read about [Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
 * Using what you learned from the codable documentation and what you discover online, convert the person class into a class that conforms to the Codable protocol.
 * Use your new class and the JSONDedocer.decode function to decode your data into a Person object
 */

import Foundation

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


do {
    
    let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    
    if let name = jsonDictionary["name"] {
        
        print("name is: \(name)")
        
    }
    
    if let age = jsonDictionary["age"] {
        
        print("age is: \(age)")
        
    }
    
    if let hasLice = jsonDictionary["hasLice"] {
        
        print("hasLice is: \(hasLice)")
        
    }
    
    if let timeSinceBirth = jsonDictionary["timeSinceBirth"] {
        
        print("timeSinceBirth is: \(timeSinceBirth)")
        
    }
    
    if let siblingNames = jsonDictionary["siblingNames"] as? [String] {
        
        for name in siblingNames {
            
            print("sibling name is: \(name)")
            
        }
        
    }
    
} catch {
    
    print("Failed to deserialize JSON: \(error.localizedDescription)")
    
}

class Person: Codable {
    
    var name: String
    
    var age: Int
    
    var hasLice: Bool
    
    var timeSinceBirth: Double
    
    var siblingNames: [String]
    
    
    
    init?(jsonDictionary: [String: Any]) {
        
        guard let name = jsonDictionary["name"] as? String,
            
            let age = jsonDictionary["age"] as? Int,
            
            let hasLice = jsonDictionary["hasLice"] as? Bool,
            
            let timeSinceBirth = jsonDictionary["timeSinceBirth"] as? Double,
            
            let siblingNames = jsonDictionary["siblingNames"] as? [String] else {
                
                return nil
                
        }
        
        self.name = name
        
        self.age = age
        
        self.hasLice = hasLice
        
        self.timeSinceBirth = timeSinceBirth
        
        self.siblingNames = siblingNames
        
    }
    
}

let person = try JSONDecoder().decode(Person.self, from: data)

// this also works...
//let person = try? JSONDecoder().decode(Person.self, from: data)



print("=== JSON unwrapped with decoder! ===")
print(person.name)
print(person.age)
print(person.hasLice)
print(person.siblingNames)
//: [Next](@next)
