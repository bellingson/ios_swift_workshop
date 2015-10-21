
import Foundation

let jsonString = "{ \"name\": \"Bob Smith\", \"email\": \"bob@hotmail.com\" }"

let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding) as NSData!

var json: NSDictionary?

do {
    try json = NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? NSDictionary
} catch let error as NSError {
    print("parse json error: \(error.localizedDescription)")
}

// optional chaining with ? fails gracefully
if let name = json?["name"] as? String {
    print("Hello \(name)")
}

// forced unwrapping fails with runtime error
if let name = json!["name"] as? String {
    print("Hello \(name)")
}






