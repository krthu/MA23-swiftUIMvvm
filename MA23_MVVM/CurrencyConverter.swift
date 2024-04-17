//
//  CurrencyConverter.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-16.
//

import Foundation

class CurrencyConverter : ObservableObject{
    @Published var currencies = [Currency(name: "Sek", rate: 10.94),
                                 Currency(name: "USD", rate: 1),
                                 Currency(name: "Eur", rate: 0.94)]

    @Published var fromCurrencyObject: Currency = Currency(name: "Sek", rate: 10.94)
    @Published var toCurrencyObject: Currency = Currency(name: "Sek", rate: 10.94)
    @Published var amountToConvert = 0.0
    var convertedAmount: Double {

        let inDollar = amountToConvert / fromCurrencyObject.rate
        return inDollar * toCurrencyObject.rate
    }
    
    init(){
        fromCurrencyObject = currencies[0]
        toCurrencyObject = currencies[1]
    }
    
}
