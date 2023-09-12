//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Yery Castro on 11/7/23.
//

import SwiftUI

struct TipCalculatorView: View {
    @State private var tipPercentage: Int = 20
    @State private var split: Int = 1
    @State private var bill: Double = 0.0
    @State private var isFocused: Bool = false
    
    let maxSplit: Int = 10
    
    var body: some View {
        ZStack {
            white.opacity(0.9).ignoresSafeArea()
            SinePathView(base: 150, delta: 75, fillColor: lightGreen)
            
            VStack {
                Text("Tip Calculator")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    EnterTotalView(bill: $bill, isFocused: $isFocused)
                    
                    ChooseTipView(tipPercentage: $tipPercentage)
                    
                    Text("Split")
                        .foregroundColor(gray)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        // decrease split
                        split = split > 1 ? split - 1 : split
                    }, label: {
                        Text("-")
                            .font(.title)
                            .foregroundColor(darkGreen)
                    })
                    
                    Text("\(split)")
                        .font(.title)
                        .foregroundColor(darkGreen)
                    
                    Button(action: {
                        // increase split
                        split = split < maxSplit ? split + 1 : split
                    }, label: {
                        Text("+")
                            .font(.title)
                            .foregroundColor(darkGreen)
                    })
                }
                
                if !isFocused {
                    PaymentSummaryView(
                        tipPercentage: tipPercentage,
                        split: split,
                        bill: bill)
                    .shadow(
                        color: black.opacity(0.3),
                        radius: 3,
                        x: 0, y: 0)
                    
                    Spacer()
                }
            }
        }
        .onTapGesture {
            UIApplication
                .shared
                .sendAction(#selector(UIResponder.resignFirstResponder),
                            to: nil,
                            from: nil,
                            for: nil)
        }
    }
}

struct FilledSquareView: View {
    let color: Color
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 50, height: 50)
    }
}

struct StrokedSquareView: View {
    let color: Color
    var body: some View {
        Rectangle()
            .stroke(color, lineWidth: 3)
            .frame(width: 50, height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculatorView()
    }
}
