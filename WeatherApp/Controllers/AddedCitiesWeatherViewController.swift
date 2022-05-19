//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aslan Murat on 13.05.2022.
//

import UIKit

class AddedCitiesWeatherViewController: UIViewController {
    var addedCities = [String]()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "magnifyingglass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        view.addSubview(searchButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let searchButtonConstraints = [
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(searchButtonConstraints)
    }

}

