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

enum DoctorNamesAre {
    case Usha,Kamala,Nirmala
}



class Hospital {
    
    var name : String
    var helpdesk : HelpDesk
    
    var doctor = [Doctor]()
    var patient = [Patient]()
    
    init(name : String)
    {
        self.name = name
        self.helpdesk = HelpDesk()
        helpdesk.hospital = self
    }
    
    
    func registorPatientToHelpdesk(doctorName : DoctorNamesAre,name : String,age : Int,gender : Gender,phoneNumber : Int)
    {
        helpdesk.registorPatient(doctorName : doctorName ,name : name,age : age,gender : gender,phoneNumber : phoneNumber)
    }
    
    func doctorDetails(name : String,numberOfPatient : Int,department :  Department)
    {
        let doc = Doctor(name: name,numberOfPatient : numberOfPatient, department: department)
        doctor.append(doc)
    }
    
    func patientDetaails()
    {
        print("------- patient details --------")

        for p in patient
        {
            print("Id : ",p.Id)
            print("name : ",p.name)
            print("age : ",p.age)
            print("gender : ",p.gender)
            print("phone number: ",p.phoneNumber)
            print("doctor name : ",p.doctorName)
            print("")
        }
    }

    func doctortDetaails()
    {
        print("------- Doctor details --------")

        for d in doctor
        {

            print("name : ",d.name)
            print("department : ",d.department)

        }
    }
}
