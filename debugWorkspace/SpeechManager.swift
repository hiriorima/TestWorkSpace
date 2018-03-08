//
//  SpeechManager.swift
//  debugWorkspace
//
//  Created by 会津慎弥 on 2018/03/08.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechManager: NSObject, AVSpeechSynthesizerDelegate {
    
    static let sharedInstance = SpeechManager()
    
    let synthesizer = AVSpeechSynthesizer()
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func startSpeech(speechText: String) {
        synthesizer.speak(setSpeechText(text: speechText))
    }
    
    func stopSpeech() {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func isSpeaking() -> Bool {
        return synthesizer.isSpeaking
    }
    
    private func setSpeechText(text: String) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.pitchMultiplier = 1.0
        
        return utterance
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("didStart")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("didFinish")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("didPause")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        print("didContinue")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("didCancel")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        print("willSpeak")
    }
}

