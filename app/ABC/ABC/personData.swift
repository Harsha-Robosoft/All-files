//
//  personData.swift
//  ABC
//
//  Created by Harsha R Mundaragi on 10/10/22.
//

import Foundation


class PersonData: NSObject, NSCoding {
    
    
    
    var name : String
    var gender : String
    var age : String
    var gmail : String
    
    init(name : String,gender : String,age : String,gmail : String)
    {
        self.name = name
        self.gender = gender
        self.age = age
        self.gmail = gmail
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(gender, forKey: "gender")
        coder.encode(age, forKey: "age")
        coder.encode(gmail, forKey: "gmail")

    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: "name") as? String,
         let gender = coder.decodeObject(forKey: "gender") as? String,
         let age = coder.decodeObject(forKey: "age") as? String ,
        let gmail = coder.decodeObject(forKey: "gmail") as? String else  { return nil }
        self.init(name : name,gender : gender,age : age,gmail : gmail)
    }
    
}
