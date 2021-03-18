//
//  ShowDataViewController.swift
//  Parciom
//
//  Created by Luane dos Santos on 18/03/21.
//

import UIKit

//Strings que recebem os dados do JSON

//
//
//class Service: NSObject{
//    static let shared = Service()
//    let headers = [
//        "x-rapidapi-key": "264eb1e1c9msh474f4ad4823ab46p14a89djsne825bf95669b",
//        "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"
//    ]
//
//    func fetchPost( city: String,completion: @escaping (Result<CityData,Error>)->()){
//        let request = NSMutableURLRequest(url: NSURL(string: "https://community-open-weather-map.p.rapidapi.com/weather?q=\(city)&mode=xml%2C%20html")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        URLSession.shared.dataTask(with: request as URLRequest){ (data, response, error) in
//            DispatchQueue.main.async {
//                if error != nil {
//                    return
//                }
//                    do{
//                        let posts = try JSONDecoder().decode(CityData.self, from: data!)
//                        completion(.success(posts))
//
//
//                    }catch{
//                        completion(.failure(error))
//                   //     print("Error parsing JSON: \(error)")
//                }
//            }
//
//        }.resume()
//
//
//    }
//
//}

class ShowDataViewController: UIViewController {
//Labels dos dados da cidade
    @IBOutlet weak var cityFind: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var tempActualLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var velocityWindLabel: UILabel!
    @IBOutlet weak var directionWindLabel: UILabel!
    
    
//Variáveis que recebem os dados da API ao mudar de view
    var city: String = ""
    var pressure: Double = 0.0000
    var humidity: Int = 0
    var latitude: Double = 0.0000
    var longitude: Double = 0.0000
    var velocity: Double = 0.0
    var direction: Int = 0
    var tempActual: Int = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    override func viewDidLoad() {
       // fetchPost(name: city)
        
        super.viewDidLoad()
      initComponents()
        
    }
    func initComponents(){
        cityFind.text = city
        pressureLabel.text = String(pressure) + "hPa"
        tempActualLabel.text = String(tempActual)
        tempMinLabel.text = String(tempMin)
        tempMaxLabel.text = String(tempMax)
        latitudeLabel.text = String(latitude)
        longitudeLabel.text = String(longitude)
        directionWindLabel.text = String(direction)
        velocityWindLabel.text = String(velocity)
        humidityLabel.text = String(humidity)
    }
}
