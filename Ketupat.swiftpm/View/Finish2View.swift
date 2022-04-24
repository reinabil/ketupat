import SwiftUI
import Foundation

struct Finish2View: View {
    @Binding var scoreFire: Int
    @Binding var time: Int
    @ObservedObject var globalData = GlobalData()
    
    @State var finalScore = 0.0
    
    func finalScoreGenerator(_ sc: Int, _ ti: Int) -> String{
        if sc < 100 {
            return "Your Ketupat still can't be eaten because it's still raw 😅"
        } else if sc >= 100 && sc < 200 {
            return "Your Ketupat is still half cooked 🤤"
        } else if sc >= 200 && sc < 300 {
            return "Your Ketupat is uncooked perfectly 🤓"
        } else {
            return "Your Ketupat is cooked perfectly 😋"
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
                                        Text(finalScoreGenerator(scoreFire, time))
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                                            .padding(.bottom, 16)
                                            .multilineTextAlignment(.leading)
                                            Image("finish")
                                                .resizable()
                                                .clipped()
                                                .scaledToFill()
                                                .frame(width: 300, height: 300, alignment: .leading)
                                                .ignoresSafeArea()
                                            Text("Awesome 🤩 You have simulated how to cook ketupat which is usually done by Indonesians when welcoming Eid Al-Fitr.\n\nIn Indonesia, we also used to say \"Minal Aidin Wal Faizin\" to each other during Eid. This sentence means \"May you be among those who have happy returns\"\n\nHopefully the momentum of Eid al-Fitr will be a good start for inter-religious harmony in the world.\n\nHappy Eid al-Fitr! Minal Aidin Wal Faizin! 😊")
                                                .font(.system(size: 18))
                                                .padding([.top], 32)
                                            
                                        Spacer()
                                        HStack(alignment: .bottom) {
                                            Button(action: {NavigationUtil.popToRootView() }, label: {
                                                Spacer()
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
//                                Spacer()
//                            HStack{
//                                Spacer()
//                                VStack(alignment: .trailing) {
//
//                                }
//                            }
                            
                        }
                            .frame(width: geo.size.width * 0.9 - 140, height: geo.size.height * 0.8, alignment: .leading)
                            .padding()
                    }
                }
            }
        }.onAppear(perform: {
            globalData.timer.upstream.connect().cancel()
        })
    }
}
