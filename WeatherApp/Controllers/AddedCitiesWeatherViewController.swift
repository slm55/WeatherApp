//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aslan Murat on 13.05.2022.
//

import UIKit

class AddedCitiesWeatherViewController: UIViewController {
    enum DegreeType {
        case celsius
        case fahrenheit
    }
    
    var addedCities = [String]()
    var selectedDegreeType: DegreeType = .celsius
    
    private let celsiusButton: UIButton = {
        let button = UIButton()
        button.setTitle("℃", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let slashLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fahrenheitButton: UIButton = {
        let button = UIButton()
        button.setTitle("℉", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .semibold)), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addCityButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.title = "Add a city"
        buttonConfiguration.image = UIImage(systemName: "plus")
        buttonConfiguration.imagePlacement = .leading
        buttonConfiguration.baseForegroundColor = .black
        buttonConfiguration.imagePadding = 10
        let button = UIButton(configuration: buttonConfiguration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(celsiusButton)
        view.addSubview(slashLabel)
        view.addSubview(fahrenheitButton)
        view.addSubview(searchButton)
        view.backgroundColor = .white
        if addedCities.isEmpty {
            view.addSubview(addCityButton)
            addCityButton.addTarget(self, action: #selector(didTapAddCityButton), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusButton.addTarget(self, action: #selector(didTapCelsiusButton), for: .touchUpInside)
        fahrenheitButton.addTarget(self, action: #selector(didTapFarenheitButton), for: .touchUpInside)
        setButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let degreeButtonsConstraints = [
            celsiusButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            celsiusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slashLabel.topAnchor.constraint(equalTo: celsiusButton.topAnchor),
            slashLabel.leadingAnchor.constraint(equalTo: celsiusButton.trailingAnchor, constant: 5),
            slashLabel.centerYAnchor.constraint(equalTo: celsiusButton.centerYAnchor),
            fahrenheitButton.topAnchor.constraint(equalTo: celsiusButton.topAnchor),
            fahrenheitButton.leadingAnchor.constraint(equalTo: slashLabel.trailingAnchor, constant: 3)
        ]
        NSLayoutConstraint.activate(degreeButtonsConstraints)
        
        let searchButtonConstraints = [
            searchButton.topAnchor.constraint(equalTo: celsiusButton.topAnchor),
            searchButton.centerYAnchor.constraint(equalTo: celsiusButton.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(searchButtonConstraints)
        
        addCityButton.center = view.center
    }
    
    @objc private func didTapCelsiusButton() {
        selectedDegreeType = .celsius
        setButtons()
    }
    
    @objc private func didTapFarenheitButton() {
        selectedDegreeType = .fahrenheit
        setButtons()
    }
    
    @objc private func didTapAddCityButton() {
        let vc = UINavigationController(rootViewController: CitySearchViewController())
        present(vc, animated: true, completion: nil)
    }
    
    private func setButtons() {
        if selectedDegreeType == .celsius {
            celsiusButton.setTitleColor(.black, for: .normal)
            fahrenheitButton.setTitleColor(.gray, for: .normal)
        } else {
            celsiusButton.setTitleColor(.gray, for: .normal)
            fahrenheitButton.setTitleColor(.black, for: .normal)
        }
    }
}

