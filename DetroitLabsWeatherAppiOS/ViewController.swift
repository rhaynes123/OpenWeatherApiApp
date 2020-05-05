//
//  ViewController.swift
//  DetroitLabsWeatherAppiOS
//
//  Created by richard Haynes on 5/4/20.
//  Copyright © 2020 richqualitydevelopment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WeatherTypeLabel: UILabel!
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    let apiKey = "11d190b14006127cf0e41d6868e79aff"
    var state = String()
    var city = String()
    var country = String()
    //http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=11d190b14006127cf0e41d6868e79aff
    var apiUrlString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GetWeatherJson(resourceUrl: apiUrlString)
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ViewWeatherBtn(_ sender: Any) {
        state = StateTextField.text!
        city = CityTextField.text!
        country = CountryTextField.text!
        apiUrlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city),\(state),\(country)&APPID=\(apiKey)"
        GetWeatherJson(resourceUrl: apiUrlString)
    }
    func getWeather(weather: String?, description: String?,temp: Int){
        TemperatureLabel.text = "\(temp)"
        WeatherTypeLabel.text = description ?? "---"
        
    }
    
    func GetWeatherJson(resourceUrl: String){
        guard let apiUrl = URL(string: resourceUrl) else{return}
        
        let newtask = URLSession.shared.dataTask(with: apiUrl){ (data,response,error) in
               if let data = data, error == nil{
                   do{
                       guard let weatherjson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as?[String : Any] else{return}
                       guard let responseDetails = weatherjson["weather"] as? [[String : Any]],let responseMain = weatherjson["main"]as?[String : Any] else {return}
                       let temp = Int(responseMain["temp"]as? Double ?? 0)
                       let description = (responseDetails.first?["description"]as? String)
                       DispatchQueue.main.async {
                           self.getWeather(weather: responseDetails.first?["main"]as? String, description: description, temp:temp)
                       }
                   }
                   catch{
                    
                }
                
            }
            
        }
           newtask.resume()
    }

}

