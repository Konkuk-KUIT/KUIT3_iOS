//
//  ContentView.swift
//  DispatchQueuePractice
//
//  Created by lee hyunhee on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text(String(counter))
        }
        .padding()
        .onAppear {
            addCounter()
        }
    }
    
    func addCounter() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            counter = counter + 1
            addCounter()
        }
    }
}

#Preview {
    ContentView()
}
