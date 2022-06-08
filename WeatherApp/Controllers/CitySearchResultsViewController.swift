//
//  CitySearchResultsViewController.swift
//  WeatherApp
//
//  Created by Aslan Murat on 04.06.2022.
//

import UIKit

class CitySearchResultsViewController: UIViewController {
    private var cityWeather: CityWeather?
    private var hasQueryText: Bool = false
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CitySearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasQueryText {
            return 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if cityWeather != nil {
            cell.textLabel?.text = "\(cityWeather!.name), \(cityWeather!.sys.country)"
            tableView.separatorColor = .separator
        } else {
            cell.textLabel?.text = "No results found"
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10000)
        }
        return cell
    }
    
    func update(with result: CityWeather?, hasQuery: Bool ) {
        cityWeather = result
        hasQueryText = hasQuery
        tableView.reloadData()
    }
    
}
