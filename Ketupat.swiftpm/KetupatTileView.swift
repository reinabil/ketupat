//
//  File.swift
//  test button
//
//  Created by Nabil Rei on 13/04/22.
//

import Foundation
import SwiftUI

struct KetupatTileView: View {
    @ObservedObject var globalData = GlobalData()
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var ketupatTest = [
        KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton(), KetupatButton()]
    var columns: [GridItem] = [GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),
                               GridItem(. fixed(70), spacing: 5),]
    
    var body: some View {
        ScrollView([.vertical]){
            Text("\(globalData.timeElapsed) seconds")
                        .onReceive(timer) { _ in
                            if globalData.timeElapsed >= 0 {
                                globalData.timeElapsed += 1
                            }
                        }
            Text(String(globalData.value))
            Button(action: {
                timer.upstream.connect().cancel()
            }, label: {
                Text("FInish")
            })
            LazyVGrid(columns: columns, spacing: 5){
                ForEach((0...99), id: \.self){i in
                    ButtonView(numberOfBox: i, globalData: globalData, viewModel: ketupatTest[i], size: 70)
                }
            }
        }
    }

}
