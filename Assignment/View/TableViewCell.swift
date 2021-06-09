//
//  TableViewCell.swift
//  Assignment
//
//  Created by Tushar Khopade on 09/06/021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(countryDetails: RestcountriesModel) {
        if let name = countryDetails.name {
            nameLabel.text = "Name: " + name
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
        
    }

}
