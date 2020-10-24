//
//  ContentView.swift
//  WeSplit
//
//  Created by Paul Yi on 10/12/20.
//

import SwiftUI

struct ContentView: View {
   @State private var checkAmount = ""
   @State private var numberOfPeople = ""
   @State private var tipPercentage = 2
   let tipPercentages = [10, 15, 20, 25, 0]
   var totalPerPerson: Double {
      // 3. Default peopleCount to 1 or 2 instead of 0 when conversion to Double fails
      let peopleCount = Double(numberOfPeople) ?? 1
      let tipSelection = Double(tipPercentages[tipPercentage])
      let orderAmount = Double(checkAmount) ?? 0
      
      let tipValue = orderAmount / 100 * tipSelection
      let grandTotal = orderAmount + tipValue
      let amountPerPerson = grandTotal / peopleCount
      
      return amountPerPerson
   }
   var checkTotal: Double {
      let tipSelection = Double(tipPercentages[tipPercentage])
      let orderAmount = Double(checkAmount) ?? 0
      
      let tipValue = orderAmount / 100 * tipSelection
      let grandTotal = orderAmount + tipValue
      
      return grandTotal
   }
   var noTipSelected: Bool {
      let tipSelection = Double(tipPercentages[tipPercentage]) ?? 0
        if tipSelection == 0 {
         return true
      } else {
         return false
      }
   }
   var body: some View {
      NavigationView {
         Form {
            Section {
               TextField("Amount", text: $checkAmount)
                  .keyboardType(.decimalPad)
               
               TextField("Number of people", text: $numberOfPeople)
            }
            // 2. Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.
            Section(header: Text("Tip percentage")) {
               Picker("Tip percentage", selection: $tipPercentage) {
                  ForEach(0 ..< tipPercentages.count) {
                     Text("\(self.tipPercentages[$0])%")
                  }
               }
               .pickerStyle(SegmentedPickerStyle())
               // 2. Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.
               
              
            }
            // 1. Add a header to the third section, saying "Amount per person"
            Section(header: Text("Amount per person")) {
               Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            // 2. Add another section showing the total amount for the check - i.e., the original amount plus tip value, without dividing by the number of people
            Section(header: Text("Check Total (including tip)")) {
               Text("$\(checkTotal, specifier: "%.2f")")
            }
            // 2. Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.
            .foregroundColor(noTipSelected ? .red : .black)
         }
         .navigationBarTitle("WeSplit")
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

