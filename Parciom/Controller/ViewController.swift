//
//  ViewController.swift
//  Parciom
//
//  Created by Luane dos Santos on 17/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var citySearch: UITextField!

    let alert = UIAlertController(title: "Carregando Dados", message: "Espere um instante", preferredStyle: UIAlertController.Style.alert)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchText(_ sender: Any) {
        
        guard !((citySearch.text ?? "" ).isEmpty)
            else {
                let alert = UIAlertController(title: "Erro", message: "Por Favor, digite o nome de uma cidade para a consulta!",
                                          preferredStyle: UIAlertController.Style.alert
                    )
                alert.addAction(
                        UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,
                                          handler: nil
                    )
                )
            self.present(alert, animated: true, completion: nil)
            return
        }
        
            alert.view.tintColor = UIColor.gray
        
        let updatingData: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
                updatingData.hidesWhenStopped = true
                updatingData.style = UIActivityIndicatorView.Style.medium
                updatingData.startAnimating();
        alert.view.addSubview(updatingData)
        self.present(alert, animated: true, completion: nil)
        let trim = citySearch.text!.replacingOccurrences(of: " ", with: "%20")
      
        //Chamada para pegar os dados da API
        fetchPost(name: trim)
        
        
    }
    
    
//Funções
    //Função que faz a chamada de conexão com a API
     func fetchPost(name: String){
        //Chama a classe Service declarada em Service.swift
        Service.shared.fetchPost(city: name){ [self] (res) in
            switch res{
            //Caso haja erro de conexão
             case
                .failure(let error):
                self.dismiss(animated: false, completion: nil)
                
                let alert = UIAlertController(title: "Falha na Consulta", message: "Esta cidade não esta em nosso sistema. Desculpe!", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
               
                
                print(error)
           //Caso não ocorra nenhum problema
             case
                .success(let posts):
                //Função que passa os dados retornados da API para a próxima View
                nextView(nameCity: (posts.name)!,
                         hum: Int((posts.main?.humidity)!),
                         lat: (posts.coord?.lat)!,
                         lon:  (posts.coord?.lon)!,
                         pressure: Int((posts.main?.pressure)!),
                         velocity: (posts.wind?.speed)!,
                         temp: Int((posts.main?.temp)! - 273.15),
                         tempMax: Int((posts.main?.temp_max)! - 273.15),
                         tempMin: Int((posts.main?.temp_min)! - 273.15),
                         direction:(posts.wind?.deg)!)
                
                print(posts)
            }
        }
    }
  
//Função que passsa por parâmetros os dados vindos da API para a View de Consultas
    func nextView(nameCity: String ,hum: Int, lat: Double, lon: Double, pressure: Int, velocity: Double,temp: Int, tempMax: Int, tempMin: Int, direction: Int){
        let dataPassed = storyboard?.instantiateViewController(withIdentifier: "ShowDataViewController") as! ShowDataViewController
                dataPassed.city = nameCity
                dataPassed.pressure = pressure
                dataPassed.humidity = hum
                dataPassed.latitude = lat
                dataPassed.longitude = lon
                dataPassed.velocity = velocity
                dataPassed.tempActual = temp
                dataPassed.tempMin = tempMin
                dataPassed.tempMax = tempMax
                dataPassed.direction = direction
            citySearch.text = ""
        
        navigationController?.pushViewController(dataPassed, animated: true)
        self.dismiss(animated: false, completion: nil)

    }
}

