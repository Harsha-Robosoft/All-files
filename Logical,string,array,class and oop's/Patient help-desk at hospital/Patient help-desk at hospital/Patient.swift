//
//  Patient.swift
//  Patient help-desk at hospital
//
//  Created by Harsha R Mundaragi on 20/09/22.
//

class Patient
{
    var name : String
    var age : Int
    var gender : String
    var phoneNumber : Int
    
    init(name : String,age : Int,gender : String,phoneNumber : Int)
    {
        self.name = name
        self.age = age
        self.gender = gender
        self.phoneNumber = phoneNumber
    }
}


class OutPatientDepartment : Patient,toDisplayOpdPatient
{
    var id : Int
    var admissionType : admissionType
    var department : departmentName
    
    init(id : Int,name : String,age : Int,gender : String,phoneNumber : Int,admissionType : admissionType ,department : departmentName)
    {
        self.id = id
        self.department = department
        self.admissionType = admissionType
        super.init(name: name, age: age, gender: gender, phoneNumber: phoneNumber)
    }
    
    func displayOpdPatientDetails()
    {
        print("")
        print("______Out Patient Details of \(name) ______")
        print("")
        print("Patient name : ",name)
        print("Age : ",age)
        print("Grnder : ",gender)
        print("Phone number : ",phoneNumber)
        print("Admission type : ", admissionType)
        print("Department for checkup : ",department)
        print("")
    }
}


class InPatientDepartment : Patient,toDisplayIpdPatient 
{
    var id : Int
    var admissionType : admissionType
    var department : departmentName
    var numberOfDaysToBeAdmitted : Int
    var insuranceNumber : Int
    init(id : Int,name : String,age : Int,gender : String,phoneNumber : Int,admissionType : admissionType ,department : departmentName,numberOfDaysToBeAdmitted : Int,insuranceNumber : Int)
    {
        self.id = id
        self.department = department
        self.admissionType = admissionType
        self.numberOfDaysToBeAdmitted = numberOfDaysToBeAdmitted
        self.insuranceNumber = insuranceNumber
        super.init(name: name, age: age, gender: gender, phoneNumber: phoneNumber)
    }
    
    
    func displayIpdPatientDetails()
    {
        print("______In Patient Details of \(name) ______")
        print("")
        print("Patient name : ",name)
        print("Age : ",age)
        print("Grnder : ",gender)
        print("Phone number : ",phoneNumber)
        print("Admission type : ", admissionType)
        print("Department for checkup : ",department)
        print("Number of days to be admitted : ",numberOfDaysToBeAdmitted)
        print("Insurance number : ",insuranceNumber)
        print("")
    }
}
