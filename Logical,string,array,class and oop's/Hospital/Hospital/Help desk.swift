//
//  Help desk.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation


class HelpDesk: RegistrationAndDoctorAvilability
{
    weak var hospital : Hospital?
    
    var Id : Int = 0
    var doctorName : String = ""

    
    func registorPatient(name : String,age : Int,gender : Gender,phoneNumber : Int)
    {
        Id += 1
        doctorName = "Usha"
        let patient = Patient(Id: Id,doctorName : doctorName, name: name, age: age, gender: gender, phoneNumber: phoneNumber)
        hospital?.patient.append(patient)
        
        
        if let doct = hospital?.doctor
        {
            for doc in doct
            {
                if (doctorName == doc.name)
                {
                    isDoctorAvilable()
                }
            }
        }
       
    }
    
    
    func isDoctorAvilable()
    {
        if let doct = hospital?.doctor
        {
            for doc in doct
            {
               let avilable = doc.doesDoctorIsAvilable()
                print(avilable)
                if (avilable == true)
                {
                    
                }
            }
        }
    }
}
