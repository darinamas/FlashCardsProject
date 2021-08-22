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

//
//Arch View driven  - view soobschaet cto delat
// Delegat - mozet byt luboj objekt. Eto object dolzen realizovavot protocol MainViewModelDelegate

//1. Create protocol "Delegat" s func showAlert()
//2. Podpisyvajem View pod protocol "Delegat" cherez exten
//3. V ViewModel var delegate: MainViewModelDelegate?
//4. V View relizov func s func showAlert()
//5.V protocol HomeViewViewModelType - var delegate: MainViewModelDelegate? { get set }


//Fabrica



