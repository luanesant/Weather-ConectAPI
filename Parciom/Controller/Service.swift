//
//  Service.swift
//  Parciom
//
//  Created by Luane dos Santos on 18/03/21.
//

import Foundation
class Service: NSObject{
    static let shared = Service()
    
    //Mude aqui sua chave!! ˆ-ˆ 🔑
    let headers = [
        "x-rapidapi-key": "264eb1e1c9msh474f4ad4823ab46p14a89djsne825bf95669b",
        "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"
    ]
    
    //Função fetchPost pega os dados e conecta com a  API.
    func fetchPost( city: String,completion: @escaping (Result<CityData,Error>)->()){
        let request = NSMutableURLRequest(url: NSURL(string: "https://community-open-weather-map.p.rapidapi.com/weather?q=\(city)&mode=xml%2C%20html")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest){ (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    return
                }
                    do{
                        let posts = try JSONDecoder().decode(CityData.self, from: data!)
                        completion(.success(posts))
                       
                       
                    }catch{
                        completion(.failure(error))
                   //     print("Error parsing JSON: \(error)")
                }
            }
            
        }.resume()
        
        
    }

}
