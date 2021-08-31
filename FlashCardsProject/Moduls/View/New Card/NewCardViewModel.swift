//
//  NewCardViewModel.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 30.07.2021.
//

import Foundation

protocol NewCardViewModelDelegate: AnyObject {
    func a()
}

class NewCardViewModel: NewCardViewViewModelType {
    
    weak var delegate: NewCardViewModelDelegate?
    
    func addNewCard(card: Cards) {
        SingleTon.shared.cards.append(card)
    }
    
    func callA() {
        delegate?.a()
    }
   
}
