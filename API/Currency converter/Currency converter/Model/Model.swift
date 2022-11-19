//
//  CountryModel.swift
//  Currency converter
//
//  Created by Harsha R Mundaragi on 10/11/22.
//

import UIKit

class CountryModel: Decodable {
    
    var symbols: [String: Data]
    
    init(symbols: [String: Data]) {
        self.symbols = symbols
    }

}

class Data: Decodable{
    
    var description: String
    var code: String
    
}


//class CalculateData: Decodable {
//    
//    var result: Double
//    
//    init(result: Double) {
//    
//        self.result = result
//    }
//}





