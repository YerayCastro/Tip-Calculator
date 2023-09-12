//
//  ChooseTipView.swift
//  Tip Calculator
//
//  Created by Yery Castro on 11/7/23.
//

import SwiftUI

let tip10: Int = 10
let tip15: Int = 15
let tip20: Int = 20
let tip25: Int = 25
let tipCUSTOM: Int = -1

struct ChooseTipView: View {
    @State var selectedTip = tip20
    @Binding var tipPercentage: Int
    
    @FocusState private var focusState: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Choose tip")
                .foregroundColor(gray)
                .multilineTextAlignment(.leading)
            
            VStack(alignment: .leading) {
                HStack {
                    SelectButtonView(
                        percentage: tip10,
                        color1: darkGreen,
                        color2: white,
                        selectedTip: $selectedTip,
                        tipPercentage: $tipPercentage)
                    SelectButtonView(
                        percentage: tip15,
                        color1: darkGreen,
                        color2: white,
                        selectedTip: $selectedTip,
                        tipPercentage: $tipPercentage)
                    SelectButtonView(
                        percentage: tip20,
                        color1: darkGreen,
                        color2: white,
                        selectedTip: $selectedTip,
                        tipPercentage: $tipPercentage)
                }
                ZStack {
                    SelectButtonView(
                        percentage: tip25,
                        color1: darkGreen,
                        color2: white,
                        selectedTip: $selectedTip,
                        tipPercentage: $tipPercentage)
                    
                    CustomTipView(selectedTip: $selectedTip, tipPercentage: $tipPercentage)
                        
                }
            }
        }
    }
}

struct CustomTipView: View {
    @Binding var selectedTip: Int
    @Binding var tipPercentage: Int
    @FocusState private var focusState: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TextField(
                "Custom",
                value: $tipPercentage,
                format: .percent)
            .focused($focusState)
            .onChange(of: focusState) {
                newValue in
                selectedTip = tipCUSTOM
            }
            .keyboardType(.numberPad)
            .font(.headline.weight(.semibold))
            .foregroundColor(selectedTip == tipPercentage ? darkGreen : white)
            .frame(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 4)
            .padding()
            .background(selectedTip == tipPercentage ? white : darkGreen)
            .clipShape(Capsule())
            .shadow(
                color: selectedTip == tipPercentage ? darkGreen : white,
                radius: 3,
                x: 2,
                y: 2)
        
        Text("Custom")
            .font(.caption)
            .foregroundColor(gray)
        }
    }
}

struct SelectButtonView: View {
    let percentage: Int
    let color1: Color
    let color2: Color
    @Binding var selectedTip: Int
    @Binding var tipPercentage: Int
    
    var body: some View {
        let isPressed: Bool = selectedTip == percentage
        
        Text("\(percentage)")
            .padding()
            .foregroundColor(isPressed ? color2 : color1)
            .background(isPressed ? color1 : color2)
            .clipShape(Capsule())
            .shadow(
                color: isPressed ? color2 : color1,
                radius: 3,
                x: 2,
                y: 2)
            .onTapGesture {
                selectedTip = percentage
                tipPercentage = percentage
            }
    }
}

struct ChooseTipView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTipView(tipPercentage: .constant(tip20))
    }
}
