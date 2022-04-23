//
//  KetupatButton.swift
//  test button
//
//  Created by Nabil Rei on 12/04/22.
//

import Foundation
import SwiftUI
import UIKit
import AVFoundation

struct ButtonView: View {
    @State var numberOfBox: Int
    @ObservedObject var globalData: GlobalData
    @State var player: AVAudioPlayer?
    @ObservedObject var viewModel: KetupatButton
    let size: CGFloat
    
    
    var body: some View {
        Button {
            withAnimation {
                if ((floor(Double(numberOfBox/10)).truncatingRemainder(dividingBy: 2)) == 0) && (floor(Double(numberOfBox%10).truncatingRemainder(dividingBy: 2)) == 0) {
                    playSound(soundName: "click")
                    viewModel.condition.toggle()
                    if viewModel.condition {
                        globalData.value += 1
                    } else {
                        if globalData.value > 0 {
                            globalData.value -= 1
                        }
                    }
                } else if ((floor(Double(numberOfBox/10)).truncatingRemainder(dividingBy: 2)) != 0) && (floor(Double(numberOfBox%10).truncatingRemainder(dividingBy: 2)) != 0) {
                    playSound(soundName: "click")
                    viewModel.condition.toggle()
                    if viewModel.condition {
                        globalData.value += 1
                    } else {
                        if globalData.value > 0 {
                            globalData.value -= 1
                        }
                    }
                } else {
                    playSound(soundName: "error")
                        viewModel.colorToShow = Color(UIColor(red: 144/255, green: 31/255, blue: 31/255, alpha: 255))
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            viewModel.colorToShow =  Color(UIColor(red: 183/255, green: 191/255, blue: 150/255, alpha: 100))
                                    }
                }
            }
        } label: {
            Rectangle()
                .frame(width: size, height: size, alignment: .leading)
                .foregroundColor(viewModel.colorToShow)
        }
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}


