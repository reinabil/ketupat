//
//  ButtonView.swift
//  fire_test
//
//  Created by Nabil Rei on 16/04/22.
//

import Foundation
import SwiftUI
import AVFoundation

struct FireButtonView: View {
    @ObservedObject var globalData = GlobalData()
    @State var fires = 0
    
    func fireAction () {
        fires += 2
    }
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var player: AVAudioPlayer?
    
    var body: some View {
            ZStack(alignment: .top) {
                Button(action: {
                    if globalData.heightFire <= 298 {
                        globalData.heightFire += 2
                    }
                    fireAction()
                    playSound(soundName: "fire")
                    print(globalData.heightFire)
                    
                }, label: {
                    ZStack {
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 300, height: 300, alignment: .leading)
                            Rectangle()
                                .foregroundColor(.orange)
                                .frame(width: 300, height: CGFloat(globalData.heightFire), alignment: .leading)
                            
                        }
                    }
                    .foregroundColor(.white.opacity(0.5))
            })
                ForEach (0..<fires, id: \.self){ _ in
                    Image(systemName: "flame.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .modifier(FireTapModifier())
                        .padding()
                }
            }
            Text("Tap the square to increase temprature")
            
        
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
