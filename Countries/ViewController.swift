//
//  ViewController.swift
//  Countries
//
//  Created by Andrey Timokhov on 09/07/2017.
//  Copyright © 2017 Andrey Timokhov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class ViewController: UITableViewController {
    var CountriesList: [String] = ["France", "Belgium", "Cyprus", "Denmark"]
    let manager: ManagerData = ManagerData()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print (Realm.Configuration.defaultConfiguration.fileURL ?? "???")
        for newCountryJSON in CountriesList {
            manager.loadJSON(countryJSON: newCountryJSON)
        }
        
        
    } //override func viewDidLoad()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountriesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = CountriesList[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } //override func didReceiveMemoryWarning(

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let IndexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailsCollectionViewController
                destinationVC.country = CountriesList[IndexPath.row]
            }
            
            
        }
    }

}

