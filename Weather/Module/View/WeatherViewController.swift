//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vaibhav Upadhyay on 05/02/23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tempTitle: UILabel?
    @IBOutlet weak var tempMonday: UILabel?
    @IBOutlet weak var tempTuesday: UILabel?
    @IBOutlet weak var tempWednesday: UILabel?
    @IBOutlet weak var tempThursday: UILabel?
    @IBOutlet weak var tempFriday: UILabel?
    @IBOutlet weak var weatherTitle: UILabel?
    @IBOutlet weak var weatherMonday: UILabel?
    @IBOutlet weak var weatherTuesday: UILabel?
    @IBOutlet weak var weatherWednesday: UILabel?
    @IBOutlet weak var weatherThursday: UILabel?
    @IBOutlet weak var weatherFriday: UILabel?
    @IBOutlet weak var citylabel: UILabel?
    
    @IBOutlet var cityTextField: UITextField!
    let cityPickerView: UIPickerView! = UIPickerView()
    private let cities = ["Mumbai", "London", "Kolkata", "Paris", "Pune"]

    let viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        cityTextField.inputView = cityPickerView
        
        viewModel.fetchWeather(city: "Mumbai") { result in
            switch result {
            case .success:
                self.setUpUI()
            case .failure(let error):
                print("Error " + error.localizedDescription)
            }
        }
        
    }
    
    private func setUpUI() {
        citylabel?.text = viewModel.city
        
        tempTitle?.text = viewModel.tempMonday
        tempMonday?.text = viewModel.tempMonday
        tempTuesday?.text = viewModel.tempTuesday
        tempWednesday?.text = viewModel.tempWednesday
        tempThursday?.text = viewModel.tempThursday
        tempFriday?.text = viewModel.tempFriday
        
        weatherTitle?.text = viewModel.weatherMonday
        weatherMonday?.text = viewModel.weatherMonday
        weatherTuesday?.text = viewModel.weatherTuesday
        weatherWednesday?.text = viewModel.weatherWednesday
        weatherThursday?.text = viewModel.weatherThursday
        weatherFriday?.text = viewModel.weatherFriday
        
        
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        cityPickerView.isHidden = false
        return false
    }
}

extension WeatherViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return cities.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        cityTextField.text = cities[row]
        cityTextField.resignFirstResponder()
        viewModel.fetchWeather(city: cities[row]) { result in
            switch result {
            case .success:
                self.setUpUI()
            case .failure(let error):
                print("Error " + error.localizedDescription)
            }
        }
    }
    
}
