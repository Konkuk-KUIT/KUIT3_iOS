//
//  ContentView.swift
//  Week10
//
//  Created by 정아현 on 6/10/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.pretendardBold14)
            Text("메롱메롱메롱")
                .font(.pretendardMedium18)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
