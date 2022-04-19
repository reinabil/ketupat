//
//  File.swift
//  test button
//
//  Created by Nabil Rei on 13/04/22.
//

import Foundation
import SwiftUI

class GlobalData: ObservableObject {
    @Published var value: Int = 10
    @Published var boxIndex: Int = 0
    @Published var height: Int = 0
    @Published var width: Int = 0
    @Published var fireTimeElapsed: Int = 0

}
