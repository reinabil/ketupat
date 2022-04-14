//
//  File.swift
//  test button
//
//  Created by Nabil Rei on 13/04/22.
//

import Foundation
import SwiftUI

class KetupatButton: ObservableObject {
    
    // When this variable changes, it will change also the color.
    var condition = false {
        didSet {
            if condition {
                colorToShow = Color(UIColor(red: 19/255, green: 58/255, blue: 27/255, alpha: 100))
            } else {
                colorToShow = Color(UIColor(red: 183/255, green: 191/255, blue: 150/255, alpha: 100))
            }
        }
    }

    @Published var colorToShow = Color(UIColor(red: 183/255, green: 191/255, blue: 150/255, alpha: 100))
}

