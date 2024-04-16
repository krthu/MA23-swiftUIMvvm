//
//  CurrencyConverterView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-16.
//

import SwiftUI

struct CurrencyConverterView: View {
    @State var amount: String = ""
    @StateObject var converter = CurrencyConverter()
    @State var selectedFromCurrency : Int = 0
    @State var selectedToCurrency : Int = 0
    
    
    var body: some View {
        List{
            HStack{
                Text("Amount")
                TextField("0.0", text: $amount)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .onChange(of: amount) {
                        if let amountDouble = Double(amount){
                            converter.amountToConvert = amountDouble
                        } else{
                            converter.amountToConvert = 0.0
                        }
                    }

            }
            HStack{
                Picker("From:", selection: $converter.fromCurrency){
                    ForEach(0..<converter.currencies.count){ index in
                        Text(converter.currencies[index].name)
                    }
                }
            }
            HStack{
                Picker("To:", selection: $converter.toCurrency){
                    ForEach(0..<converter.currencies.count){ index in
                        Text(converter.currencies[index].name)
                        
                    }
                }
            }
            HStack{
                Text("Converted:")
                Spacer()
                Text("\(converter.convertedAmount)")
            }
        }
    }
}

#Preview {
    CurrencyConverterView()
}
