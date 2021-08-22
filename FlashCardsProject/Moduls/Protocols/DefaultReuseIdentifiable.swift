//
//  DefoultReuseIdentifiable.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 27.07.2021.
//

import Foundation
import UIKit

protocol DefaultReuseIdentifiable {
    static var typeName: String { get }
}

extension UITableViewCell: DefaultReuseIdentifiable {
    static var typeName: String { //dynamic var
        return String(describing: self) //CardTableViewCell
    }
}
