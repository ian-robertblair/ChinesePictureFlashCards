//
//  SpeechRecognizer.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/20.
//

import Foundation
import Speech
import OSLog
import UIKit

class SpeechRecognizer {
    //TODO: - If recognizer isn't available it should show a message
    
    static private let defaultLog = Logger()
    static private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))!
    static private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    static private var recognitionTask: SFSpeechRecognitionTask?
    static private let audioEngine = AVAudioEngine()
    
    class func accessSpeech(text: String,  completion: @escaping (SFSpeechRecognitionResult?, Error?)->Void) throws {
            self.audioEngine.stop()
            self.audioEngine.inputNode.removeTap(onBus: 0)
            self.recognitionTask?.cancel()
            self.recognitionTask = nil
            
            //Audio session
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            // The AudioBuffer
            self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            self.recognitionRequest?.contextualStrings = [text]
            self.speechRecognizer.defaultTaskHint = .dictation

            self.recognitionTask = self.speechRecognizer.recognitionTask(with: recognitionRequest!) { result, error in
                //handle error
                
                
                if let result = result {
                    //isFinal = result.isFinal
                    
                    completion(result, nil)
                    
                } //end if result == result
            }  //end task
        
        //Configure mic
        let recordingFormat = self.audioEngine.inputNode.outputFormat(forBus: 0)
        
        //set buffer size
        self.audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer , when: AVAudioTime ) in
            self.recognitionRequest?.append(buffer)
        }
    
        
        self.audioEngine.prepare()
        try self.audioEngine.start()
        
        sleep(3)
        //Stop recording
        self.audioEngine.stop()
        self.audioEngine.inputNode.removeTap(onBus: 0)
        self.recognitionRequest = nil
        self.recognitionTask = nil
    }
    
    class func permissions() -> Bool {
        var returnValue = true
       
        SFSpeechRecognizer.requestAuthorization { authStatus in
                if authStatus == .authorized {
                    defaultLog.debug("Speech recognition authorized.")
                } else {
                    defaultLog.debug("Speech recognition permission was declined.")
                    returnValue = false
                }
        }
       
        return returnValue
    }
    
    class func isAvailable() -> Bool {
        if let speechRecognizer = SFSpeechRecognizer() {
            return speechRecognizer.isAvailable
        } else {
            return false
        }
    }
}

