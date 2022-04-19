import Foundation
import SwiftUI

struct FiresEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 100 ... 200)
    var x = Double.random(in:  -0.9 ... 0.9)
    var y = Double.random(in: -Double.pi ...  0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * x
        let yTranslation = speed * sin(y) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
