//
//  Department.swift
//  Patient help-desk at hospital
//
//  Created by Harsha R Mundaragi on 20/09/22.
//

import Foundation

class General: Department,generalDoctordetails
{
    
    
    var opdPatientDetails = [OutPatientDepartment]()
    
    init(departmentName : departmentName,doctorName : String,numberofPatientsAllocatedForADay : Int)
    {
        self.doctorName = doctorName
        self.numberofPatientsAllocatedForADay = numberofPatientsAllocatedForADay
        super.init(departmentName: departmentName)
    }
    
    
    func opdPatientDetailsAre(details1 : OutPatientDepartment)
    {
        opdPatientDetails.append(details1)
    }
    
    
    func generalCheckupDoctorDetail()
    {
        print("")
        print("----------- General doctor details -----------")
        print("Department : ",departmentName)
        print("Doctor name : ",doctorName)
        print("Number of patients allocated for a day is : ",numberofPatientsAllocatedForADay)
    }
}



class Orthopedic : Department,orthoDoctordetails
{
    var doctorName : String
    var numberofPatientsAllocatedForADay : Int
    
    var opdPatientDetails = [OutPatientDepartment]()

    init(departmentName : departmentName,doctorName : String,numberofPatientsAllocatedForADay : Int)
    {
        self.doctorName = doctorName
        self.numberofPatientsAllocatedForADay = numberofPatientsAllocatedForADay
        super.init(departmentName: departmentName)
    }
    
    
    func ipdPatientDetailsAre(details2 : OutPatientDepartment)
    {
        opdPatientDetails.append(details2)
    }

    
    func orthopedicCheckupDoctorDetail()
    {
        print("")
        print("----------- Orthopedic doctor details -----------")
        print("Department : ",departmentName)
        print("Doctor name : ",doctorName)
        print("Number of patients allocated for a day is : ",numberofPatientsAllocatedForADay)
    }
}
