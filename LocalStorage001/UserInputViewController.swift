//
//  ViewController.swift
//  LocalStorage001
//
//  Created by Amit Gupta on 3/24/21.
//

import UIKit

class UserInputViewController: UIViewController {
    
    //@IBOutlet weak var co2Reading: UITextView!
    
    @IBOutlet weak var co2Reading: UITextField!
    //@IBOutlet weak var tempReading: UITextView!
    
    @IBOutlet weak var tempReading: UITextField!
    
    //@IBOutlet weak var humidityReading: UITextView!
    
    @IBOutlet weak var humidityReading: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataStore.dumpAllKeys()
        getStoredReadings()
        print("At program start, the values are:",co2Reading.text,
              tempReading.text,humidityReading.text)
    }

    func getStoredReadings() {
        co2Reading.text = String(DataStore.getCO2() ?? 0)
        tempReading.text = String(DataStore.getTemperature() ?? 0)
        humidityReading.text = String(DataStore.getHumidity() ?? 0 )
    }
    
    func storeReadings(valueCO2: Int, valueTemp: Float, valueHumidity: Int) {
        DataStore.setCO2(valueInt: valueCO2)
        DataStore.setTemperature(valueFloat: valueTemp)
        DataStore.setHumidity(valueInt: valueHumidity)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        let c=co2Reading.text!
        let t=tempReading.text!
        let h = humidityReading.text!
        storeReadings(valueCO2: Int(c) ?? 0, valueTemp: Float(t) ?? 0.0, valueHumidity: Int(h) ?? 0)
        
        print("Submit pressed")
        print("CO2=",c,"ppm. Temp=",t,"F. Humidity=",h,"%")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          view.endEditing(true)
      }
    
}

