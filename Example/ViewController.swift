//
//  ViewController.swift
//  Example
//
//  Created by Amr Omran on 04.02.18.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var accX: UITextField!
    @IBOutlet weak var accY: UITextField!
    @IBOutlet weak var accZ: UITextField!
    
    @IBOutlet weak var gyrX: UITextField!
    @IBOutlet weak var gyrY: UITextField!
    @IBOutlet weak var gyrZ: UITextField!
    
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accX.isEnabled = false
        accY.isEnabled = false
        accZ.isEnabled = false
        gyrX.isEnabled = false
        gyrY.isEnabled = false
        gyrZ.isEnabled = false
    }
    
    @IBAction func accBtn(_ sender: Any) {
        
        motionManager.accelerometerUpdateInterval = 0.5
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            
            if (error != nil){
                print("error")
            }else{
                let accelerometerData = data
                self.accX.text =  String(accelerometerData!.acceleration.x)
                self.accY.text = String(accelerometerData!.acceleration.y)
                self.accZ.text = String(accelerometerData!.acceleration.z)
            }
        }
    }
    
    
    @IBAction func gyrBtn(_ sender: Any) {
        
        motionManager.gyroUpdateInterval = 0.5
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if (error != nil){
                print("error")
            }else{
                let gyroData = data
                self.gyrX.text = String(gyroData!.rotationRate.x)
                self.gyrY.text = String(gyroData!.rotationRate.y)
                self.gyrZ.text = String(gyroData!.rotationRate.z)
            }
        }
    }
    
    
    @IBAction func resetBtn(_ sender: Any) {
        motionManager.stopGyroUpdates()
        motionManager.stopAccelerometerUpdates()
        self.gyrX.text = ""
        self.gyrY.text = ""
        self.gyrZ.text = ""
        self.accX.text = ""
        self.accY.text = ""
        self.accZ.text = ""
    }
    


}

