//
//  datafile.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 19/10/22.
//

import Foundation

var users = [UserDetails]()

class UserDetails: NSObject, NSCoding{
    
    var mobileNumber: String

    var details = [UserData]()

    init(mobileNumber: String){

    self.mobileNumber = mobileNumber

    }

    init(mobileNumber: String, details: [UserData]){

        self.mobileNumber = mobileNumber

        self.details = details

    }

    func encode(with coder: NSCoder) {

        coder.encode(mobileNumber, forKey: "mobileNumber")

        coder.encode(details,forKey: "details")

    }

    required convenience init?(coder: NSCoder) {

        guard let mobileNumber = coder.decodeObject(forKey: "mobileNumber") as? String,

              let details = coder.decodeObject(forKey: "details") as? [UserData] else {

            return nil

        }

        self.init(mobileNumber: mobileNumber, details: details)

    }

}


