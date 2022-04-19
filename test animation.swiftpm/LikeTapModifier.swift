//
//  LikeTapModifier.swift
//  test animation
//
//  Created by Nabil Rei on 16/04/22.
//

import Foundation
import SwiftUI

struct LikeTapModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.orange)
                .modifier(LikesGeometryEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
