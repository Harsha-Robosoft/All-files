//
//  Patient.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation


class Patient{
    
    var Id : Int
    var doctorName : String
    var name : String
    var age : Int
    var gender : Gender
    var phoneNumber : Int
    
    
    init(Id : Int,doctorName : String,name : String,age : Int,gender : Gender,phoneNumber : Int)
    {
        self.Id = Id
        self.doctorName = doctorName
        self.name = name
        self.age = age
        self.gender = gender
        self.phoneNumber = phoneNumber
    }
}
