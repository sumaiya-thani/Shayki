//
//  UserInfo.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//

import Foundation


struct CarInfo {
    enum EngineType: Int {
        case fourCylinder = 4
        case sixCylinder = 6
        case eightCylinder = 8
    }
    var numberOfCylinders: EngineType
    var odometerReading: Int
    var dailyKilometersDriven: Int
    var oilTypeBrand: String
}
struct CarInfoo {

    var oilTypeBrand: String
}
