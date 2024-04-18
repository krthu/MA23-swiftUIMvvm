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
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    fromPicker(converter: converter, amount: $amount)
                
                    toPicker(converter: converter)
                    
                }
                .navigationTitle("Convert")

            }
        }
    }
}


struct fromPicker : View{
    @ObservedObject var converter: CurrencyConverter
    @Binding var amount : String
    
    var body: some View{
        
        Picker(selection: $converter.fromCurrencyObject, label: TextField("Amount", text: $amount)
            .keyboardType(.numberPad)
            .onChange(of: amount) {
                if let amountDouble = Double(amount){
                    converter.amountToConvert = amountDouble
                } else{
                    converter.amountToConvert = 0.0
                }
            }
               
        ){
            ForEach(converter.currencies, id: \.self ){ currency in
                Text(currency.name).tag(currency.id)
            }
        }
    }
}

struct toPicker :View {
    @ObservedObject var converter: CurrencyConverter
    var body: some View {
        HStack{
            Picker(selection: $converter.toCurrencyObject, label: Text("\(converter.convertedAmount, specifier: "%.2f")")){
                ForEach(converter.currencies, id: \.self ){ currency in
                    Text(currency.name).tag(currency.id)
                }
            }
            
        }
    }
}





#Preview {
    CurrencyConverterView()
}
