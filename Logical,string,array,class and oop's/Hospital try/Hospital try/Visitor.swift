//
//  Visitor.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation


class Visitor
{
    var name : String
    var age : Int
    var gender : Gender
    var phoneNumber : Int
    
    init(name : String,age : Int,gender : Gender,phoneNumber : Int)
    {
        self.name = name
        self.age = age
        self.gender = gender
        self.phoneNumber = phoneNumber
    }
}

