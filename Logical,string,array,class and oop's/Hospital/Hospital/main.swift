//
//  main.swift
//  Hospital
//
//  Created by Harsha R Mundaragi on 24/09/22.
//

import Foundation




var hospital1 = Hospital(name: "Kamala")


var visitor1 = Visitor(name: "Harsha", age: 20, gender: Gender.M, phoneNumber: 0987654321)


hospital1.doctorDetails(name: "Usha", numberOfPatient : 5,department: Department.Neurologist)
hospital1.registorPatientToHelpdesk(visitor : visitor1)

//hospital1.patientDetaails()
//hospital1.doctortDetaails()
