//
//  NewThemeViewModel.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 31.07.2021.
//

import Foundation

class NewThemeViewModel: NewThemeViewModelType {
    func addNewTheme(theme: Themes) {
        SingleTon.shared.themes.append(theme)
    }
    
}
