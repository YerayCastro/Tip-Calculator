//
//  SinePathView.swift
//  Tip Calculator
//
//  Created by Yery Castro on 11/7/23.
//

import SwiftUI

struct SinePathView: View {
    let base: CGFloat
    let delta: CGFloat
    let fillColor: Color
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        Path { path in
            path.move(to: CGPoint(x: 0, y: base))
            path.addCurve(to: CGPoint(x: width, y: base),
                              control1: CGPoint(x: width * 0.25, y: base - delta),
                              control2: CGPoint(x: width * 0.7, y: base + delta))
            path.addLine(to: CGPoint(x: width, y: base-height))
            path.addLine(to: CGPoint(x: 0, y: base-height))
            
        }.fill(fillColor)
            .ignoresSafeArea()
    }
}

struct SinePathView_Previews: PreviewProvider {
    static var previews: some View {
        SinePathView(base: 0, delta: 100, fillColor: lightGreen.opacity(0.7))
    }
}
