import SwiftUI

struct WhatIsKetupatView: View {
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
                            HStack(alignment: .top, spacing: 32) {
                                ScrollView {
                                    VStack(alignment: .leading){
                                        Text("What is\nKetupat?")
                                            .font(.system(size: 56))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                                            .padding(.bottom, 16)
                                            .multilineTextAlignment(.leading)
                                        Text("As many as 1.9 billion Muslims in the world celebrate Eid al-Fitr every year after they fast for 30 days in the month of Ramadan. Like other religious holidays in general, Muslims are very happy to welcome this Eid.\n\nIndonesia, as a country with the largest Muslim population in the world, has its own characteristics in welcoming the month of Ramadan. One of them is by serving Eid specialties, ketupat.\n\nKetupat is a typical Indonesian food that is served every entering Eid al-Fitr. Ketupat contains rice wrapped in woven young coconut leaves as shown in the picture below. The ketupat, which is filled with rice and wrapped in woven coconut leaves, will then be cooked within 2 hours. In Indonesia, ketupat is a food that must be served when Eid al-Fitr comes.\n\nKetupat is not eaten alone, but ketupat is usually eaten together with ‘opor ayam’ and ‘lontong sayur’.")
                                            .font(.system(size: 24))
                                    }
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    ZStack(alignment: .bottomLeading){
                                        Image("uncookedKetupat")
                                            .resizable()
                                            .frame(width: geo.size.width/2.5, height: geo.size.height * 0.8, alignment: .leading)
                                            .ignoresSafeArea()
                                        Text("Uncooked ketupat.\nPhoto by Mufid Majnun on Unsplash")
                                            .foregroundColor(.white)
                                            .padding(16)
                                    }
                                    Spacer()
                                    NavigationLink(destination: IntroGameView(), label: {
                                        HStack{
                                            Text("Play Game")
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
