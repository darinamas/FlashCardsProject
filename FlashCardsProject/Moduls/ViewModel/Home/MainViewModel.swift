//
//  MainViewModel.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 26.07.2021.
//

import Foundation
//ViewModel nezavisit ot MainVC
// class Delegat
// Otpravlyat dannye
protocol MainViewModelDelegate: AnyObject { //protocol dlya VC
    func showAlert()
}


class MainViewModel: HomeViewViewModelType {
    
   weak var delegate: MainViewModelDelegate?
    
    func numberOfRows() -> Int {
        return SingleTon.shared.cards.count
    }

    func start() {
        delegate?.showAlert()
    }
}



