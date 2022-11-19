//
//  SavePasswoed.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 19/10/22.
//

import Foundation

class UserData: NSObject, NSCoding{

    var url: String

    var siteName: String

    var userName: String

    var sector: String

    var password: String

    var note: String

    init(url: String, siteName: String, userName: String, sector: String, password: String, note: String){

        self.url = url

        self.siteName = siteName

        self.userName = userName

        self.sector = sector

        self.password = password

        self.note = note

    }

    func encode(with coder: NSCoder) {

        coder.encode(url, forKey: "url")

        coder.encode(siteName,forKey: "siteName")

        coder.encode(userName,forKey: "userName")

        coder.encode(sector,forKey: "sector")

        coder.encode(password,forKey: "password")

        coder.encode(note,forKey: "note")

    }
    
    required convenience init?(coder: NSCoder) {

        guard let url = coder.decodeObject(forKey: "url") as? String,

              let siteName = coder.decodeObject(forKey: "siteName") as? String,

              let userName = coder.decodeObject(forKey: "userName") as? String,

              let sector = coder.decodeObject(forKey: "sector") as? String,

              let password = coder.decodeObject(forKey: "password") as? String,

              let note = coder.decodeObject(forKey: "note") as? String

        else{

            return nil

        }

        self.init(url: url, siteName: siteName, userName: userName, sector: sector, password: password, note: note)

    }

}
