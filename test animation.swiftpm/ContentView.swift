import SwiftUI

struct ContentView: View {
    @State var likes = 0
    
    func likeAction () {
        likes += 1
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .onTapGesture {
                                likeAction()
                            }
                        
                        ForEach (0..<likes, id: \.self){ _ in
                            Image(systemName: "flame.fill")
                                .resizable()
                                .frame(width: 30, height: 40)
                                .modifier(LikeTapModifier())
                                .padding()
                        }
                        
                    }.foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }
}
