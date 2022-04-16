import SwiftUI
import Foundation

struct FinishView: View {
    @Binding var score: Int
    @Binding var time: Int
    @ObservedObject var globalData = GlobalData()
    
    @State var finalScore = 0.0
    
    func finalScoreGenerator(_ sc: Int, _ ti: Int) -> Int{
        if sc < 45 {
            return sc
        }
        if ti >= 0 && ti <= 30 {
            return sc + 50
        } else if ti >= 31 && ti <= 60 {
            return sc + 40
        } else if ti >= 61 && ti <= 90 {
            return sc + 30
        } else if ti >= 91 && ti <= 120 {
            return sc + 20
        } else if ti >= 121 && ti <= 150 {
            return sc + 10
        } else {
            return sc + 0
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
                            HStack(alignment: .top, spacing: 32) {
                                ScrollView {
                                    VStack(alignment: .leading){
                                        Text("Final Score : \(finalScoreGenerator(score, time))\n(0-100)")
                                            .font(.system(size: 72))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("AccentColor"))
                                            .padding(.bottom, 16)
                                            .multilineTextAlignment(.leading)
                                        Text("Wow, you have successfully woven the Ketupat. Here are some ketupat philosophies :\n\n1. Woven coconut leaves : signifies the complexity of Javanese society which must be glued together by staying in touch\n\n2. Ketupat shape : basic human lust: emotion, hunger and thirst, desire to have something good, and forcing oneself\n\n3.  Contain rice : illustrates that every human being has the lust of the world\n\n4. Janur : is a vocabulary in Javanese for young coconut leaves. Derived from the word \"jaa a al-nur\" in Arabic which means the light has come\n\nOverall, the philosophy of ketupat is the lust of the world wrapped in conscience. 😇")
                                            .font(.system(size: 24))
                                    }
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    ZStack(alignment: .bottomLeading){
                                        Image("cookedKetupat")
                                            .resizable()
                                            .frame(width: geo.size.width/2.5, height: geo.size.height * 0.8, alignment: .leading)
                                            .ignoresSafeArea()
                                        Text("Cooked ketupat.\nPhoto by Mufid Majnun on Unsplash")
                                            .foregroundColor(.white)
                                            .padding(16)
                                    }
                                    Spacer()
                                    Button(action: {NavigationUtil.popToRootView()}, label: {
                                        HStack{
                                            Text("Go to home")
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

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }

        return nil
    }
}


