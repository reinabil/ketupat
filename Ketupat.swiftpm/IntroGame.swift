import SwiftUI

struct IntroGameView: View {
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
                                    Text("Part 1. How to Play")
                                        .font(.system(size: 56))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("AccentColor"))
                                        .padding(.bottom, 16)
                                        .multilineTextAlignment(.leading)
                                    HStack(alignment: .center, spacing: 16){
                                        Image("initialGame")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .leading)
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: .leading)
                                            .foregroundColor(Color("AccentColor"))
                                        Image("goalGame")
                                            .resizable()
                                            .frame(width: 200, height: 200, alignment: .leading)
                                           
                                    }
                                    Text("You will be given many squares of the same color. When you touch one of these squares, the color of the box will change. Your task is to turn the squares into a series of plaits that don't have adjacent colors like ketupat. Remember, the time spent when you play determines your final score")
                                        .font(.system(size: 24))
                                        .padding([.top], 32)
                                    
                                    Spacer()
                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        NavigationLink(destination: GameView(), label: {
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
