//
//  ViewController.swift
//  IMC-Calculator-IOS
//
//  Created by Mañanas on 5/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var PesoLabel: UILabel!
    @IBOutlet weak var AlturaLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    var weight = 60
    var height = 200
    var color: UIColor!
    var text: String!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func weightChangeButton(_ sender: UIStepper) {
        
        weight = Int(sender.value)
        PesoLabel.text = "\(weight) KG"
        
    }
    
    @IBAction func heightChangeSlider(_ sender: UISlider) {
        height = Int(sender.value)
        AlturaLabel.text = "\(height) CM"
    }
    
    @IBAction func calcButton(_ sender: Any) {
        
        let result = Float(weight) / pow((Float(height) / 100.0), 2)
        resultLabel.text = String(format: "%.2f", result)
        
        var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        var alertUrl = ""
        
        switch result {
        case 0..<19:
            color = UIColor(named: "bajo") ?? .yellow // Asegúrate de tener colores definidos en tu Assets
            text = NSLocalizedString("Bajo", comment: "")
            showAlert = true
            alertTitle = "Cuidado con tu salud"
            alertMessage = "Deberias seguir estas recomendaciones para prevenir riesgos de salud"
            alertUrl = "https://www.topdoctors.es/diccionario-medico/bajo-peso/"
            imageResult.image = UIImage(named: "bajo")!
            
        case 20..<35:
            color = UIColor(named: "normal") ?? .green
            text = NSLocalizedString("Normal", comment: "")
            imageResult.image = UIImage(named: "normal")!
            
        case 36..<45:
            color = UIColor(named: "sobrepeso") ?? .red
            text = NSLocalizedString("Sobrepeso", comment: "")
            showAlert = true
            alertTitle = "Cuidado con tu salud"
            alertMessage = "Deberias seguir estas recomendaciones para mejorar tu salud"
            alertUrl = "https://www.clinicalondres.es/blog/nutricion/como-prevenir-la-obesidad-habitos-y-consejos.html"
            imageResult.image = UIImage(named: "sobrepeso")!
        default:
            color = UIColor(named: "obesidad") ?? .red
            text = NSLocalizedString("Obesidad", comment: "")
            showAlert = true
            alertTitle = "Riesgo de salud"
            alertMessage = "Tu peso actual pone en grave riesgo tu vida. Busca ayuda médica cuanto antes."
            alertUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
            imageResult.image = UIImage(named: "obesidad")!
            
            
        }
        descriptionResult.text = text
        descriptionResult.textColor = color
        resultLabel.textColor = color
        
        
        if (showAlert) {
                   let alert = UIAlertController(
                    title: alertTitle,
                    message: alertMessage,
                       preferredStyle: .alert
                   )
                   alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                       // He pulsado mas información
                       if let url = URL(string: alertUrl), UIApplication.shared.canOpenURL(url) {
                           UIApplication.shared.open(url)
                       }
                   }))
                   alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               }
    }
}

