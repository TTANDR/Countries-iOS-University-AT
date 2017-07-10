//
//  ManagerData.swift
//  Countries
//
//  Created by Andrey Timokhov on 10/07/2017.
//  Copyright © 2017 Andrey Timokhov. All rights reserved.
//
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

class ManagerData {
    func loadJSON(countryJSON: String) {
        
        let realm = try! Realm()
        
        let url = "https://restcountries.eu/rest/v2/name/\(countryJSON)"
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let country = CountriesData()
                
//                try! realm.write {
//                    realm.deleteAll()
//                }
                
                
                //var i=0
                //for _ in json {
                print("*", json[0]["name"].stringValue, json[0]["capital"].stringValue, json[0]["area"].numberValue )
                country.name = json[0]["name"].stringValue
                country.capital = json[0]["capital"].stringValue
                country.currency = json[0]["currencies"][0]["name"].stringValue
                country.area = json[0]["area"].stringValue
                country.population = json[0]["population"].stringValue
                
                print(country.name, country.capital, country.currency, country.area, country.population)
                
                try! realm.write {
                    realm.add(country)
                }
                
                
                //i+=1

            case .failure(let error):
                print("!!!ERROR!!!: \(error)")
            } //switch
            
        } //Alamofire.request
    }
    
    
}
