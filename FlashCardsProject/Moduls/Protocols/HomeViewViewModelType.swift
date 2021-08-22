//
//  TableViewViewModelType.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 27.07.2021.
//

import Foundation

//протокол для связи MainViewController (Делигатор) и MainViewModel (Делигат)
protocol HomeViewViewModelType: class {
    func numberOfRows() -> Int
    func start()
    var delegate: MainViewModelDelegate? { get set }
}
