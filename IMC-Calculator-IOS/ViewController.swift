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
        
        
        switch result {
        case 0..<18.5:
            color = UIColor(named: "bajo") ?? .black  // Asegúrate de tener colores definidos en tu Assets
            text = NSLocalizedString("bajo", comment: "")
            
        case 18.5..<25:
            color = UIColor(named: "normal") ?? .black
            text = NSLocalizedString("normal", comment: "")
            
        case 25..<30:
            color = UIColor(named: "sobrepeso") ?? .black
            text = NSLocalizedString("sobrepeso", comment: "")
            
        case 30..<35:
            color = UIColor(named: "obesidad1") ?? .black
            text = NSLocalizedString("obesidad1", comment: "")
            
        case 35..<40:
            color = UIColor(named: "obesidad2") ?? .black
            text = NSLocalizedString("obesidad2", comment: "")
            
        default:
            color = UIColor(named: "obesidad3") ?? .black
            text = NSLocalizedString("obesidad3", comment: "")
        }
        
        descriptionResult.text = text
        descriptionResult.textColor = color
    }
}

