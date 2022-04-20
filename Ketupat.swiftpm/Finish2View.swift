import SwiftUI
import Foundation

struct Finish2View: View {
    @Binding var scoreFire: Int
    @Binding var time: Int
    @ObservedObject var globalData = GlobalData()
    
    @State var finalScore = 0.0
    
    func finalScoreGenerator(_ sc: Int, _ ti: Int) -> Int{
        if sc < 250 {
            let res = (sc/4)
            if res <= 0 {
                return 0
            } else {
                return res
            }
        }
        if ti >= 0 && ti <= 30 {
            return sc/3
        } else if ti >= 31 && ti <= 60 {
            return (sc/3)-10
        } else if ti >= 61 && ti <= 90 {
            return (sc/3)-20
        } else if ti >= 91 && ti <= 120 {
            return (sc/3)-30
        } else if ti >= 121 && ti <= 150 {
            return (sc/3)-40
        } else {
            return (sc/3)-50
        }
    }
    
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
                    HStack{
                        GeometryReader {
                            geo in
                            ScrollView {
                                    VStack(alignment: .leading){
                                        Text("Part 2 Score : \(finalScoreGenerator(scoreFire, time))\n(0-100)")
                                            .font(.system(size: 72))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                                            .padding(.bottom, 16)
                                            .multilineTextAlignment(.leading)
                                        HStack(alignment: .top){
                                            Image("finish")
                                                .resizable()
                                                .clipped()
                                                .scaledToFill()
                                                .frame(width: 300, height: 300, alignment: .leading)
                                                .ignoresSafeArea()
                                            Text("Cool! You have simulated how to cook ketupat which is usually done by Indonesians when welcoming Eid Al-Fitr.\n\nIn Indonesia, we also used to say \"Minal Aidin Wal Faizin\" to each other during Eid. This sentence means \"May you be among those who have happy returns\"\n\nHopefully the momentum of Eid al-Fitr will be a good start for inter-religious harmony in the world.\n\nHappy Eid al-Fitr! Minal Aidin Wal Faizin! 😊")
                                                .font(.system(size: 24))
                                        }
                                    }
                                }
                                Spacer()
                            HStack{
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Spacer()
                                    Button(action: {NavigationUtil.popToRootView() }, label: {
                                        HStack{
                                            Text("Back to home")
                                                .font(.system(size: 40))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Image(systemName: "house.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30, alignment: .leading)
                                                .padding(.leading, 8)
                                                .foregroundColor(.white)
                                        }
                                        .padding([.top, .bottom], 10)
                                        .padding([.leading, .trailing], 30)
                                        .background(Color("AccentColor"))
                                    })
                                }
                            }
                            
                        }
                            .frame(width: geo.size.width * 0.9 - 140, height: geo.size.height * 0.8, alignment: .leading)
                            .padding()
                    }
                }
            }
        }
    }
}
