//
//  ContentView.swift
//  ConcurrencyTest
//
//  Created by 고정아 on 2021/08/04.
//

import SwiftUI

struct ContentView: View {
  
  let operation = CalculatePrimeOperation()
  @State private var calculationDisabled = false
  
  
    var body: some View {
      VStack {
        Spacer()
        DatePicker(selection: .constant(Date())) { Text("Date") }
          .labelsHidden()
        Button(action: calculatePrimes, label: { Text("Calculate Primes") })
          .disabled(calculationDisabled)
        Spacer()
      }
    }
  
  
  func calculatePrimes() {
    // 1st func
    //    let queue = OperationQueue()
    //    (let mainQueue = OperationQueue.main)
    //    queue.addOperation(operation)
    
    
    calculationDisabled = true
    // 2nd func
    DispatchQueue.global(qos: .userInitiated).async {
      for number in 0...1_000_000 {
        let isPrimeNumber = operation.isPrime(number: number)
        print("\(number) is prime: \(isPrimeNumber)")
      }
      calculationDisabled = false
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
