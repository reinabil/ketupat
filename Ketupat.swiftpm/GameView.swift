import SwiftUI
import UIKit
import AVFoundation

struct GameView: View {
    @State var player: AVAudioPlayer?
    @ObservedObject var globalData = GlobalData()
    @State var currentDate = Date()
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
        GeometryReader {
            geo in
            ZStack {
                Image("background")
                    .resizable()
                    .clipped()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.9, alignment: .leading)
                    VStack(alignment: .leading){
                        ScrollView([.vertical, .horizontal]){
                            HStack{
                                ZStack{
                                    HStack{
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .leading)
                                            .padding(.trailing, 8)
                                            .foregroundColor(Color("AccentColor"))
                                        Text("\(globalData.timeElapsed) seconds")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                                            .onReceive(globalData.timer) { _ in
                                                if globalData.timeElapsed >= 0 {
                                                    globalData.timeElapsed += 1
                                                }
                                            }
                                    }
                                    .padding([.top, .bottom], 10)
                                    .padding([.leading, .trailing], 15)
                                    
                                }
                                .border(Color("AccentColor"), width: 5)
                                .padding(.leading, 32)
                                Spacer()
                                ZStack{
                                    HStack{
                                        Image(systemName: "sparkles")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .leading)
                                            .padding(.trailing, 8)
                                            .foregroundColor(Color("AccentColor"))
                                        Text("\(globalData.value) points")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                
                                    }
                                    .padding([.top, .bottom], 10)
                                    .padding([.leading, .trailing], 15)
                                    
                                }
                                .border(Color("AccentColor"), width: 5)
                                .padding(.leading, 16)
                                Spacer()
                                NavigationLink(destination: FinishView(score: $globalData.value, time: $globalData.timeElapsed).navigationBarBackButtonHidden(true), label: {
                                    HStack{
                                        Text("Finish")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .leading)
                                            .padding(.leading, 8)
                                            .foregroundColor(.white)
                                    }
                                    .padding([.top, .bottom], 10)
                                    .padding([.leading, .trailing], 20)
                                    .background(Color("AccentColor"))
                                })
                                .simultaneousGesture(TapGesture().onEnded({globalData.timer.upstream.connect().cancel()}))
                                .padding([.leading], 16)
                                .padding([.trailing], 32)
                            }.padding(.top, 32)
                                .padding(.bottom, 25)
                            LazyVGrid(columns: columns, spacing: 5){
                                ForEach((0...99), id: \.self){i in
                                    ButtonView(numberOfBox: i, globalData: globalData, viewModel: ketupatTest[i], size: 70)
                                }
                            }.padding(.bottom, 32)
                        }
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.9, alignment: .leading)
                    }
                }
            }
        }.onAppear(perform: {
            globalData.timeElapsed = 0
            
        })
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

