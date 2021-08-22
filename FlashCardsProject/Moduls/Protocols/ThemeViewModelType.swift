//
//  ThemeViewModelType.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 31.07.2021.
//

import Foundation

//протокол для связи ThemeViewController (Делигатор) и ThemeViewModel (Делигат)
protocol ThemeViewModelType {
    func numberOfRows() -> Int
}
