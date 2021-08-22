//
//  ThemeViewModel.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 31.07.2021.
//

import Foundation

class ThemeViewModel: ThemeViewModelType {
    
    func numberOfRows() -> Int {
        return SingleTon.shared.themes.count
    }

}
