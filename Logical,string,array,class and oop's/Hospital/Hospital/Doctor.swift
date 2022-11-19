//
//  Doctor.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation

class Doctor: DoctorAvilable
{
        
    var name : String
    var numberOfPatient : Int
    var department :  Department
    
    init(name : String,numberOfPatient : Int,department :  Department)
    {
        self.name = name
        self.numberOfPatient = numberOfPatient
        self.department = department
    }
    
    
    
    func doesDoctorIsAvilable() -> Bool
    {
        if numberOfPatient > 10
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    
    
}
