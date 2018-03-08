//
//  SpeechViewController.swift
//  debugWorkspace
//
//  Created by 会津慎弥 on 2018/03/08.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import UIKit

class SpeechViewController: UIViewController {
    
    var count = 0
    let speechManager = SpeechManager.sharedInstance
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        
        count += 1
        label.text = String(count) + "枚"
        play(text: String(count))
    }
    
    func play(text: String){
        
        if speechManager.isSpeaking() {
            speechManager.stopSpeech()
        }
        
        if count % 3 == 0 {
            speechManager.startSpeech(speechText: "1枚たりなーーい")
        }else {
            speechManager.startSpeech(speechText: text + "枚")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
