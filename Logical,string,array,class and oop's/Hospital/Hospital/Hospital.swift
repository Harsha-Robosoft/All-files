//
//  Hospital.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation


enum Gender
{
    case M,F,T
}

enum Department {
    case Otrhopedic,Dentist,Neurologist
}


protocol RegistrationAndDoctorAvilability
{
    func registorPatient(name : String,age : Int,gender : Gender,phoneNumber : Int)
    func isDoctorAvilable()
}


protocol DoctorAvilable {
    func doesDoctorIsAvilable() -> Bool
}


class Hospital {
    
    var name : String
    var helpdesk : HelpDesk
    var records : Records
    
    var doctor = [Doctor]()
    var patient = [Patient]()
    
    init(name : String)
    {
        self.name = name
        self.helpdesk = HelpDesk()
        self.records = Records()
        records.hospital = self
        helpdesk.hospital = self
    }
    
    
    func registorPatientToHelpdesk(visitor : Visitor)
    {
        helpdesk.registorPatient(name: visitor1.name, age: visitor1.age, gender: visitor.gender, phoneNumber: visitor1.phoneNumber)
    }
    
    func doctorDetails(name : String,numberOfPatient : Int,department :  Department)
    {
        let doc = Doctor(name: name,numberOfPatient : numberOfPatient, department: department)
        doctor.append(doc)
    }
    
//    func patientDetaails()
//    {
//        for p in patient
//        {
//            print("Id : ",p.Id)
//            print("name : ",p.name)
//            print("age : ",p.age)
//            print("gender : ",p.gender)
//            print("phone number: ",p.phoneNumber)
//
//        }
//    }
//    
//    func doctortDetaails()
//    {
//        for d in doctor
//        {
//            print("name : ",d.name)
//            print("department : ",d.department)
//
//        }
//    }
}
