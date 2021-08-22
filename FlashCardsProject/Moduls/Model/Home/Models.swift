//
//  Models.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 26.07.2021.
//

import Foundation

struct Cards {
    let question: String?
    let answer: String?
    let id: String
    let tag: Themes
    
}

struct Themes {
    let name: String
    let color: Colors
    let id: String
    
    enum Colors {
        case green
        case red
        case blue
    }
}
