//
//  main.swift
//  Patient help-desk at hospital
//
//  Created by Harsha R Mundaragi on 20/09/22.
//

enum admissionType{
    case OPD
    case IPD
}
enum departmentName{
    case GeneralCheckup
    case Orthopedic
}
protocol toDisplayOpdPatient{
    func displayOpdPatientDetails()
}
protocol toDisplayIpdPatient{
    func displayIpdPatientDetails()
}
protocol generalDoctordetails{
    func generalCheckupDoctorDetail()
}
protocol orthoDoctordetails{
    func orthopedicCheckupDoctorDetail()
}
//    _____________________________________________________________________________________________________________________________________

class HelpDesk
{
    
    var doctorName : String
    var doctorDepartment : String
    
    var generalDoctorsDetails = [General]()
    var orthopedicDoctorsDetails = [Orthopedic]()
    
    var opdPatients = [OutPatientDepartment]()
    var ipdPatients = [InPatientDepartment]()
    
    var opdPatientsDetails : [Int : OutPatientDepartment] = [:]
    var ipdPatientsDetails : [Int : InPatientDepartment] = [:]

//    _____________________________________________________________________________________________________________________________________
    
    func opdPatientDetailsAre(id : Int,name : String,age : Int,gender : String,phoneNumber : Int,admissionType: admissionType,department : departmentName)
    {
        let opd = OutPatientDepartment(id : id,name: name, age: age, gender: gender, phoneNumber: phoneNumber, admissionType: admissionType, department: department)
        opdPatients.append(opd)
        
        opdPatientsDetails[id] = opd

        for general in generalDoctorsDetails
        {
        if (department == departmentName.GeneralCheckup && opdPatients.count <= general.numberofPatientsAllocatedForADay )
            {
                general.opdPatientDetailsAre(details1:opd)
            }
        }
        
        for ortho in orthopedicDoctorsDetails
        {
            if (department == departmentName.Orthopedic && opdPatients.count <= ortho.numberofPatientsAllocatedForADay)
            {
                ortho.ipdPatientDetailsAre(details2 : opd)
            }
        }
    }
    
    
    
    func ipdPatientDetailsAre(id : Int,name : String,age : Int,gender : String,phoneNumber : Int,admissionType : admissionType ,department : departmentName,numberOfDaysToBeAdmitted : Int,insuranceNumber : Int)
    {
        let ipd = InPatientDepartment(id : id,name: name, age: age, gender: gender, phoneNumber: phoneNumber, admissionType: admissionType, department: department,numberOfDaysToBeAdmitted : numberOfDaysToBeAdmitted,insuranceNumber : insuranceNumber)
        ipdPatients.append(ipd)
        
        ipdPatientsDetails[id] = ipd
    }
    
    
    func generalDoctorsDetailsAre(departmentName : departmentName,doctorName : String,numberofPatientsAllocatedForADay : Int)
    {
        let general = General(departmentName: departmentName, doctorName: doctorName, numberofPatientsAllocatedForADay: numberofPatientsAllocatedForADay)
        generalDoctorsDetails.append(general)
    }
    
    func orthopedicDoctorsDetailsAre(departmentName : departmentName,doctorName : String,numberofPatientsAllocatedForADay : Int)
    {
        let orthopedic = Orthopedic(departmentName: departmentName, doctorName: doctorName, numberofPatientsAllocatedForADay: numberofPatientsAllocatedForADay)
        orthopedicDoctorsDetails.append(orthopedic)
    }

    

//  _____________________________________________________________________________________________________________________________________

    
    func opdPatientDetails()
    {
        for patient in opdPatients
        {
            patient.displayOpdPatientDetails()
        }
    }
    
    func ipdPatientDetails()
    {
        for patient in ipdPatients
        {
            patient.displayIpdPatientDetails()
        }
     }
    
    func generalDepartmentDoctorDetail()
    {
        for doctor in generalDoctorsDetails
        {
            doctor.generalCheckupDoctorDetail()
        }
    }
    
    func orthopedivDepartmentDoctorDetail()
    {
        for doctor in orthopedicDoctorsDetails
        {
            doctor.orthopedicCheckupDoctorDetail()
        }
    }
}


// ========================================================================================================================================

var opdApplication = HelpDesk()
var ipdApplication = HelpDesk()
var generalDepartment = HelpDesk()
var orthopedicDepartment = HelpDesk()


generalDepartment.generalDoctorsDetailsAre(departmentName: departmentName.GeneralCheckup, doctorName: "XYZ", numberofPatientsAllocatedForADay: 10)
orthopedicDepartment.orthopedicDoctorsDetailsAre(departmentName: departmentName.Orthopedic, doctorName: "ZXY", numberofPatientsAllocatedForADay: 10)



opdApplication.opdPatientDetailsAre(id: 1,name: "ABC", age: 17, gender: "Male", phoneNumber: 1234567890, admissionType: admissionType.OPD, department: departmentName.GeneralCheckup)

ipdApplication.ipdPatientDetailsAre(id: 1,name: "DEF", age: 23, gender: "Male", phoneNumber: 0987654321, admissionType: admissionType.IPD, department: departmentName.Orthopedic,numberOfDaysToBeAdmitted: 10,insuranceNumber: 765434567)

opdApplication.opdPatientDetailsAre(id: 2,name: "GHI", age: 21, gender: "Male", phoneNumber: 0987654321, admissionType: admissionType.OPD, department: departmentName.Orthopedic)
generalDepartment.generalDepartmentDoctorDetail()
orthopedicDepartment.orthopedivDepartmentDoctorDetail()

opdApplication.opdPatientDetails()
ipdApplication.ipdPatientDetails()





