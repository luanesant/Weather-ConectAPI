//
//  ShowDataViewController.swift
//  Parciom
//
//  Created by Luane dos Santos on 18/03/21.
//

import UIKit

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
    var pressure: Int = 0
    var humidity: Int = 0
    var latitude: Double = 0.0000
    var longitude: Double = 0.0000
    var velocity: Double = 0.0
    var direction: Int = 0
    var tempActual: Int = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initComponents()
        
    }
    //Ação do botão compartilhar
    @IBAction func shareButton(_ sender: Any) {
        //texto de Compartilhamento
                let share = [ """
         Aviso dos Surfista a localização: longitude: \(latitudeLabel.text!) e latitude: \(latitudeLabel.text!), de nome \(cityFind.text!) se encontra em ótimas condições. Veja abaixo:

            Temperatura Atual: \(tempActualLabel.text!)
            Temperatura \(tempMaxLabel.text!)
            Temperatura \(tempMinLabel.text!)
            Umidade: \(humidityLabel.text!)

        E se você quiser velejar, veja as condições:
            Velocidade do vento: \(velocityWindLabel.text!)
            Direção do Vento: \(directionWindLabel.text!)


        Não Perde a chance e vem voando pra cá!!!!!!!
        """
        ]
        //chamada do modal de compartilhamento
         let activityController = UIActivityViewController(activityItems: share, applicationActivities: nil)
                activityController.popoverPresentationController?.sourceView = self.view
        
                activityController.excludedActivityTypes = [
                    UIActivity.ActivityType.airDrop,
                    UIActivity.ActivityType.postToTwitter,
                    UIActivity.ActivityType.postToFacebook
                ]
        
                self.present(activityController, animated: true, completion: nil)
    }
    //Inicialização de componentes
    func initComponents(){
        cityFind.text = city
        pressureLabel.text = String(pressure) + " hPa"
        tempActualLabel.text = String(tempActual) + "º"
        tempMinLabel.text = "Mín.: " + String(tempMin) + "ºC"
        tempMaxLabel.text = "Máx.: " + String(tempMax) + "ºC"
        latitudeLabel.text = String(latitude)
        longitudeLabel.text = String(longitude)
        directionWindLabel.text = String(direction) + "º"
        velocityWindLabel.text = String(velocity) + " Km/h"
        humidityLabel.text = String(humidity) + "%"

    }
    
    
}
