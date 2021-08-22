//
//  NewCardViewModel.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 30.07.2021.
//

import Foundation

class NewCardViewModel: NewCardViewViewModelType {
    
    func addNewCard(card: Cards) {
        SingleTon.shared.cards.append(card)
    }
    
    
   
}
