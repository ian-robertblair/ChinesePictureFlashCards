//
//  PonsClient.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/2/5.
//

import Foundation
import UIKit
import OSLog

class PonsClient {
    static var defaultLog = Logger()
    static var secret = "fad667c498f0332717a8918e8d13d8278eb71b74e5fb80ff62b61f11bf8d7216"
    static var base = "https://api.pons.com/v1/dictionaries?language=zh"
    
    
    class func search(url:URL, term:String, completion: @escaping (Error?, [String]?)->Void) {
        
        var dictionaryResponse = [String()]
        
        var request = URLRequest(url: url)
        request.addValue(PonsClient.secret, forHTTPHeaderField: "X-Secret")
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if error != nil {
                defaultLog.info("PONS Client URL Task Error: \(error!.localizedDescription)")
                completion(error, nil)
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            print("Status Code: ", httpResponse.statusCode)
            let decoder = JSONDecoder()
            
            if httpResponse.statusCode == 200 {
                PonsClient.defaultLog.info("PONS Client HTTP Respsponse status code: 200")
                
                do {
                    var source = ""
                    var target = ""
                    let allHits = try decoder.decode([Hits].self, from: data!)
                    
                    for eachHits in allHits {
                        
                        for translation in eachHits.hits[0].roms[0].arabs[0].translations {
                            source = translation.source
                            target =  translation.target
                            
                            let strippedSource = stripHTML(source)
                            defaultLog.debug("Stripped source:  \(strippedSource)")
                            
                            let strippedTarget = stripHTML(target)
                            defaultLog.debug("Stripped target: \( strippedTarget)")
                            dictionaryResponse.append("\(strippedSource):   \(strippedTarget)")
                        } //translations
                        completion(nil, dictionaryResponse)
                    } //allHits
                
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                switch httpResponse.statusCode {
                case 204:
                    completion(PonsErrors.error204, nil)
                    return
                case 404:
                    completion(PonsErrors.error404, nil)
                    return
                case 403:
                    completion(PonsErrors.error403, nil)
                    return
                case 500:
                    completion(PonsErrors.error500, nil)
                    return
                case 503:
                    completion(PonsErrors.error503, nil)
                    return
                default:
                    completion(PonsErrors.unknownError, nil)
                }
            }
        }.resume()
    }
    
    private class func stripHTML(_ text:String) -> String {
        var textString = text
        let htmlTags = [
        "<strong class=\"headword\">",
        "</strong>",
        "<span class=\"idiom_proverb\">",
        "<strong class=\"tilde\">",
        "<span class=\"zphrase\">",
        "<span class=\"zhu\">",
        "</span>",
        "<span class=\"zpinyin\">",
        "<span class=\"pyu\">"
            ]
        
        for tag in htmlTags {
            while textString.contains(tag) {
                if let range = textString.range(of: tag) {
                    textString.removeSubrange(range)
                }
            }
        }
        
        return textString
    }
}

