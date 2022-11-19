//
//  main.swift
//  Hospital try
//
//  Created by Harsha R Mundaragi on 25/09/22.
//

import Foundation


var hospital1 = Hospital(name: "MAX")


var visitor1 = Visitor(name: "Harsha", age: 20, gender: Gender.M, phoneNumber: 0987654321)
var visitor2 = Visitor(name: "Jeegu", age: 32, gender: Gender.M, phoneNumber: 1234567890)


hospital1.doctorDetails(name: "Usha", numberOfPatient : 5,department: Department.Neurologist)
hospital1.doctorDetails(name: "Nirmal", numberOfPatient: 7, department: Department.Dentist)
hospital1.doctorDetails(name: "Kamala", numberOfPatient: 10, department: Department.Otrhopedic)

hospital1.registorPatientToHelpdesk(doctorName : DoctorNamesAre.Usha,name : visitor1.name,age : visitor1.age,gender : visitor1.gender,phoneNumber : visitor1.phoneNumber)

hospital1.registorPatientToHelpdesk(doctorName: DoctorNamesAre.Usha , name: visitor2.name, age: visitor2.age, gender: visitor2.gender, phoneNumber: visitor2.phoneNumber)

hospital1.helpdesk.checkDoctorAvilable(doctorname: "Usha")

hospital1.helpdesk.checkDoctorAvilable(doctorname: "Nirmala")

hospital1.patientDetaails()
hospital1.doctortDetaails()

