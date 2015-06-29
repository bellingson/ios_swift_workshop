
import Foundation

let jsonString = "{ \"name\": \"Bob Smith\", \"email\": \"bob@hotmail.com\" }"

let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding) as NSData!

var error: NSError?

let json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(jsonData,
                                                    options: nil,
                                                    error: &error) as? NSDictionary

if let err = error {
    println("parse json error: \(err.localizedDescription)")
}

// optional chaining with ? fails gracefully
if let name = json?.objectForKey("name") as? String {
    println("Hello \(name)")
}

// forced unwrapping fails with runtime error
if let name = json!.objectForKey("name") as? String {
    println("Hello \(name)")
}






