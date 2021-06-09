//
//  CuntryDetailsViewController.swift
//  Assignment
//
//  Created by Tushar Khopade on 09/06/021.
//

import UIKit

class CuntryDetailsViewController: UIViewController {

    var countryDetails = RestcountriesModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var callingCodeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var borderringCountriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView() 
    }
    
    
    func setupView() {
        if let name = countryDetails.name {
            nameLabel.text = "Name: " + name
            titleLabel.text = name
        }
        
        if let capitalName = countryDetails.capital {
            capitalNameLabel.text = "Capital Name: " + capitalName
        }
        
        if let population = countryDetails.population {
            populationLabel.text = "Population: " + "\(population)"
        }
        
        if let currency = countryDetails.currencies?[0].symbol {
            currencyLabel.text = "Currency: " + currency
        }
        
        if let callingCode = countryDetails.callingCodes?[0] {
            self.callingCodeLabel.text = "Calling Code: " + callingCode
        }
        
        if let region = countryDetails.region {
            regionLabel.text = "Currency: " + region
        }
        
        if let borders = countryDetails.borders {
            borderringCountriesLabel.text = "Borders: " + borders.joined(separator: ", ")
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    

}
