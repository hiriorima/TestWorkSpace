//
//  ViewController.swift
//  debugWorkspace
//
//  Created by 会津慎弥 on 2017/12/20.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit
import AVFoundation

class LEDViewController: UIViewController {

    let avDevice = AVCaptureDevice.default(for: AVMediaType.video)

    var timer: Timer!
    
    var state = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.changeLight), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func changeLight(){
        state = !state
        light(state: state)
    }
    
    func light(state: Bool){
        guard let device = avDevice else {
            return
        }
        if device.hasTorch {
            let torchOn = !device.isTorchActive
            
            
            do {
                try device.lockForConfiguration()
            } catch {
                return
            }
            
            if(state){
            do {
                try device.setTorchModeOn(level: 0.0001)
            } catch {
                print("error")
            }
            device.unlockForConfiguration()
            }else {
                device.torchMode = AVCaptureDevice.TorchMode.off
            }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

