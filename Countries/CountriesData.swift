//
//  CountriesData.swift
//  Countries
//
//  Created by Andrey Timokhov on 09/07/2017.
//  Copyright © 2017 Andrey Timokhov. All rights reserved.
//

import Foundation
import RealmSwift

class CountriesData: Object  {
    dynamic var name: String = ""
    dynamic var capital: String = ""
    dynamic var currency: String = ""
    dynamic var area: String = ""
    dynamic var population: String = ""
    
}
