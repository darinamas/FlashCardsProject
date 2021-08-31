//
//  Models.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 26.07.2021.
//

import Foundation

struct Cards {
    var question: String?
    var answer: String?
    let id: String
    var tag: Themes
    var wasEdit: Bool
    
}

struct Themes {
    var name: String
    var color: Colors
    var id: String
    
    enum Colors {
        case green
        case red
        case blue
    }
}
