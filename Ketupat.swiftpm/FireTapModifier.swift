//
//  LikeTapModifier.swift
//  test animation
//
//  Created by Nabil Rei on 16/04/22.
//

import Foundation
import SwiftUI

struct FireTapModifier: ViewModifier {
    @ObservedObject var globalData = GlobalData()
    @State var time = 0.0
    let duration = 1.0
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .symbolRenderingMode(.palette)
                 .foregroundStyle(
                     .linearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottomTrailing)
                     
                 )
                .modifier(FiresEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
