//
//  Help desk.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation


class HelpDesk
{
    weak var hospital : Hospital?
    
    var Id : Int = 0

    
    
    func registorPatient(doctorName : DoctorNamesAre,name : String,age : Int,gender : Gender,phoneNumber : Int)
    {
        Id += 1
        let patient = Patient(Id: Id,doctorName :doctorName, name: name, age: age, gender: gender, phoneNumber: phoneNumber)
        hospital?.patient.append(patient)
    
    }
    
    
    
    func checkDoctorAvilable(doctorname : String)
    {
        if let doct = hospital?.doctor
        {
            for doc in doct
            {
                if (doctorname == doc.name)
                {
                    let avilable = doc.doesDoctorIsAvilable()
                    if (avilable == true)
                    {
                        if let pati = hospital?.patient
                        {
                            for pat in pati
                            {
                                doc.recivepatient(Id: Id)
                            }
                        }

                    }
                }
            }
        }
    }


    
    
}




