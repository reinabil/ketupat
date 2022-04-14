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
                            
                                VStack(alignment: .leading, spacing: 16){
                                    Text("Points : \(score)\nTime elapsed : \(time)\nFinal Score : \(finalScoreGenerator(score, time))")
                                        .font(.system(size: 72))
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
                                    Text("You will be given many boxes of the same color. When you touch one of these squares, the color of the box will change. Your task is to turn the squares into a series of plaits that don't have adjacent colors like ketupat. Remember, the time spent when you play determines your final score")
                                        .font(.system(size: 24))
                                        .padding([.top], 32)
                                    
                                    Spacer()
                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        Button(action: { NavigationUtil.popToRootView() }, label: {
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
