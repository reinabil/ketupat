import SwiftUI

struct HomeView: View {
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
                VStack(spacing: 30) {
                    ZStack{
                        Text("Weaving Ketupat")
                            .font(.system(size: geo.size.width * 0.08))
                            .fontWeight(.bold)
                            .foregroundColor(Color("AccentColor"))
                            .padding([.top, .bottom], 10)
                            .padding([.leading, .trailing], 40)
                            .background(Color.white)
                    }
                    NavigationLink(destination: WhatIsKetupatView().navigationBarTitle(Text(""), displayMode: .inline), label: {
                        HStack {
                            Text("Let's weave together")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                            .foregroundColor(Color("AccentColor"))
                            .padding(.trailing, 10)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .clipped()
                                .frame(width: 30, height: 30, alignment: .leading)
                        }
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.white)
                    }
                    )
                }
            }
        }
    }
}
