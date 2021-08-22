//
//  SingleTon.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 30.07.2021.
//

import Foundation

class SingleTon {
    static var shared = SingleTon()

    
var cards: [Cards] = [
        Cards(question: "What is generics?",
              answer: "A type that can take in any type.",
              id:"1",
              tag: Themes(name: "Swift", color: .blue, id: "1")),
        Cards(question: "What are protocols?",
              answer: "Protocols enables shared functionality across classes.",
              id:"2",
              tag:Themes(name: "ios", color: .green, id: "2")),
        Cards(question: "How delegate works?",
              answer: "I don't know",
              id:"3",
              tag: Themes(name: "Swift", color: .red, id: "3"))
   ]
    
    var themes: [Themes] = [Themes(name: "Swift", color: .red, id: "3"),
                            Themes(name: "ios", color: .blue, id: "4"), 
    ]
    
    private init() {
       }
    
}
