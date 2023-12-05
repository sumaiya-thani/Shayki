//
//  CarViewModel.swift
//  Shayki
//
//  Created by SHUAA on 05-12-2023.
//

import Foundation

import Foundation


class CarViewModel : ObservableObject {
    
    @Published var carInfo = CarInfo()
    
    
    
    func setValues (carmodel :String,str1 :String , str2 :String  , str3 :String)
    {
        carInfo.carModel = carmodel
        carInfo.odometerReading = str1
        
        carInfo.dailyKilometersDriven = str2

        
        carInfo.oilTypeBrand = str3

    }
    
}
