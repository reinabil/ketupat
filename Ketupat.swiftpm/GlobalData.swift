//
//  File.swift
//  test button
//
//  Created by Nabil Rei on 13/04/22.
//

import Foundation
import SwiftUI

class GlobalData: ObservableObject {
    @Published var value: Int = 0
    @Published var boxIndex: Int = 0
    @Published var timeElapsed: Int = 60
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var fireTimeElapsed: Int = 60
    @Published var heightFire: Int = 50
}
