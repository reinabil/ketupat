import SwiftUI

struct IntroGame2View: View {
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
                            
                                VStack(alignment: .leading, spacing: 16){
                                    Text("Part 2. How to Play")
                                        .font(.system(size: 72))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("AccentColor"))
                                        .padding(.bottom, 16)
                                        .multilineTextAlignment(.leading)
                                    HStack(alignment: .center, spacing: 16){
                                        Image("fireInitial")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .leading)
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: .leading)
                                            .foregroundColor(Color("AccentColor"))
                                        Image("fireGoal")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .leading)
                                           
                                    }
                                    Text("Wow, you just finished weaving the Ketupat. After finishing weaving, Ketupat is filled with rice and then cooked for quite a long time, about 2 hours. Indonesians usually use an oil stove to cook ketupat so it doesn't waste gas or electricity too much. In the next game, you will play to increase the temperature of the stove so that we can cook ketupat quickly. Touch the box repeatedly until the temperature reaches 300 degrees Celsius")
                                        .font(.system(size: 24))
                                        .padding([.top], 32)
                                    
                                    Spacer()
                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        NavigationLink(destination: Game2View(), label: {
                                            HStack{
                                                Text("Start")
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
