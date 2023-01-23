//
//  DecodeStructs.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/19.
//

import Foundation

struct WordCodeable: Codable {
    var pronunciation:String
    var audio:String
    var chineseWord:String
    var englishWord:String
}

struct DeckCodeable: Codable {
    var name: String
    var words:[WordCodeable]
}


struct Hits:Codable{
    let lang:String
    let hits:[Hit]
}
struct Hit:Codable {
    let type: String
    let opendict:Bool
    let roms:[Rom]
    
}

struct Rom:Codable {
    let headword:String
    let headword_full:String
    let wordclass: String?
    let arabs:[Arab]
}

struct Arab:Codable {
    let header:String
    let translations: [Translation]
}

struct Translation:Codable {
    let source:String
    let target:String
}
