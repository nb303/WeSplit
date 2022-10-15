//
//  ContentView.swift
//  WeSplit
//
//  Created by Nitika Bhardwaj on 2021-07-06.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    //@State allows values to change inside a struct
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson: Double {
        //calculate total per person here
        //let numPeople = Double(numberOfPeople) ?? 1
        let numPeople = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / numPeople
        return amountPerPerson
    }
    var wholeTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let billTotal = orderAmount + tipValue
        return billTotal
    }
    var body: some View {
        NavigationView{
        Form {
            Section {
                TextField("Amount: $", text: $checkAmount)
                    .keyboardType(.decimalPad)
                Picker("Number of People:", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")) {
                
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                        //$ sign allows two way binding so tippercentages can update and show up on screen
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total check amount")){
                Text("$ \(wholeTotal, specifier: "%.2f")")            }
      
            Section(header: Text("Total amount per person")) {
                Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
                Image("the")
                    .resizable()
                    .scaledToFit()
            }
        .navigationBarTitle("Nitika's Bill Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


