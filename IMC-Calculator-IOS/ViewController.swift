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
    
    var weight = 60
    var height = 200
    
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

     }

}

