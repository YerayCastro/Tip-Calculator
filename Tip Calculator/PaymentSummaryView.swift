//
//  PaymentSummaryView.swift
//  Tip Calculator
//
//  Created by Yery Castro on 12/7/23.
//

import SwiftUI

struct PaymentSummaryView: View {
    let tipPercentage: Int
    let split: Int
    let bill: Double
    
    var totalCost: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let tipPercentageDecimal = Double(tipPercentage) / 100
        let splitDouble = Double(split)
        let tipIncludedBeforeSplit = bill + bill * tipPercentageDecimal
        return formatter
            .string(
                from: NSNumber(
                    value: tipIncludedBeforeSplit / splitDouble
                )
            ) ?? "$0"
    }
    
    
    
    var billCost: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let splitDouble = Double(split)
        return formatter
            .string(
                from: NSNumber(
                    value: bill / splitDouble
                )
            ) ?? "$0"
    }
    
    
    var tipCost: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let tipPercentageDecimal = Double(tipPercentage) / 100
        let splitDouble = Double(split)
        return formatter
            .string(
                from: NSNumber(
                    value: bill * tipPercentageDecimal / splitDouble
                )
            ) ?? "$0"
    }
    
    var body: some View {
        ZStack {
            lightGreen
            
            VStack(spacing: 20) {
                Spacer()
                SubTotalView(
                    title: "Total per person",
                    titleFont: .headline,
                    amount: totalCost,
                    amountFont: .largeTitle,
                    spacing: 10)
                Spacer()
                
                HStack {
                    Spacer()
                    SubTotalView(
                        title: "Bill",
                        titleFont: .headline,
                        amount: billCost,
                        amountFont: .headline,
                        spacing: nil)
                    Spacer()
                    SubTotalView(
                        title: "Tip",
                        titleFont: .headline,
                        amount: tipCost,
                        amountFont: .headline,
                        spacing: nil)
                    Spacer()
                    
                }
                Spacer()
            }
        }.cornerRadius(20)
            .padding()
    }
}

struct SubTotalView: View {
    let title: LocalizedStringKey
    let titleFont: Font
    let amount: String
    let amountFont: Font
    let spacing: CGFloat?
    
    var body: some View {
        VStack {
            Text(title)
                .font(titleFont)
                .foregroundColor(gray)
            
            Text(amount)
                .font(amountFont)
                .fontWeight(.semibold)
                .foregroundColor(darkGreen)
                .multilineTextAlignment(.leading)
        }
    }
}

struct PaymentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSummaryView(tipPercentage: 20, split: 1, bill: 37.54)
    }
}
