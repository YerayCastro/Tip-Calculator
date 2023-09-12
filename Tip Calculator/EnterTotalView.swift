//
//  EnterTotalView.swift
//  Tip Calculator
//
//  Created by Yery Castro on 11/7/23.
//

import SwiftUI

struct EnterTotalView: View {
    
    @Binding var bill: Double
    @State private var animate: Bool = false
    
    @FocusState private var focusState: Bool
    @Binding var isFocused: Bool
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Enter Total")
                .foregroundColor(gray)
            .multilineTextAlignment(.leading)
            
            TextField("Amount",
                      value: $bill,
                      format: .currency(
                        code: Locale.current.currencyCode ?? "USD"))
            .focused($focusState)
            .onChange(of: focusState) {
                newValue in
                isFocused = newValue
            }
            .keyboardType(.decimalPad)
            .frame(width: width / 2)
            .font(.largeTitle.weight(.semibold))
            .foregroundColor(red)
            .scaleEffect(animate ? 1.05 : 1.0)
            .animation(.easeInOut(duration: 2).repeatForever(), value: animate)
            .onAppear {
                animate = true
            }
            
        }
    }
}


