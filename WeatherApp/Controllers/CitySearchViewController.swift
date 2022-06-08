//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Aslan Murat on 03.06.2022.
//

import UIKit

class CitySearchViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    private let searchController = UISearchController(searchResultsController: CitySearchResultsViewController())
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemGray
        title = "Enter a city name"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.delegate = self
        searchController.isActive = true
        searchController.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let resultsController = searchController.searchResultsController as? CitySearchResultsViewController else {
            return
        }
        
              guard let query = searchController.searchBar.text, query.count >= 1,
                      !query.trimmingCharacters(in: .whitespaces).isEmpty else {
                          resultsController.update(with: nil, hasQuery: false)
                          return
                }
        
        APICaller.shared.search(with: query) {
            result in
            DispatchQueue.main.async {
                            switch result {
                            case .success(let result):
                                resultsController.update(with: result, hasQuery: true)
                            case .failure(let error):
                                resultsController.update(with: nil, hasQuery: true)
                                print(error.localizedDescription)
                            }
                        }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
