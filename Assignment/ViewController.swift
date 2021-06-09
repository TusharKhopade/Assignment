//
//  ViewController.swift
//  Assignment
//
//  Created by Sagar Sukode on 19/03/1943 Saka.
//

import UIKit

class HomeViewController: UIViewController {

    private let apiClient = APIClient()
    var allCountries = [RestcountriesModel]()
    var allCountriesFitlered = [RestcountriesModel]()
    var isSearching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    fileprivate func setupView() {
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.tableFooterView = UIView()
        fetchAllCountries()
    }
    
    func goToHomeScreen(countryDetails:RestcountriesModel) {
        let storyBoard : UIStoryboard = UIStoryboard(name: Constants.shared.kMainStoryBoard, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: Constants.shared.kDetailVC) as! CuntryDetailsViewController
        nextViewController.countryDetails = countryDetails
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }

    func fetchAllCountries() {
        apiClient.getListInfo(from: .listRecords) { [weak self] result in
            switch result{
                
            case .success(let meteorites):
                self?.allCountries = meteorites
                self?.allCountriesFitlered = meteorites
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isSearching ? self.allCountriesFitlered.count : allCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.configureCell(countryDetails: self.isSearching ? self.allCountriesFitlered[indexPath.row] : allCountries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            self.goToHomeScreen(countryDetails: self.allCountriesFitlered[indexPath.row])
        } else {
            self.goToHomeScreen(countryDetails: self.allCountries[indexPath.row])
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty {
            self.allCountriesFitlered = self.allCountries
        } else {
            let filteredArray = self.allCountries.filter{providerObj in
                let name = providerObj.name
                let categoryName = providerObj.capital
                let subCategoryName = String(providerObj.population ?? 0)
                return (name!.localizedCaseInsensitiveContains(searchTextField.text!) ||
                            categoryName!.localizedCaseInsensitiveContains(searchTextField.text!) ||
                            subCategoryName.localizedCaseInsensitiveContains(searchTextField.text!))
            }
            
            self.allCountriesFitlered = filteredArray
        }
        
        isSearching = true
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
