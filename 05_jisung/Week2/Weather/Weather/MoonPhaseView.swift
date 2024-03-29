//
//  MoonPhaseView.swift
//  Weather
//
//  Created by 임지성 on 3/26/24.
//

import SwiftUI

struct MoonPhaseView: View {
    let description: String
    let amount: String
    
    var body: some View {
        HStack {
            Text(description)
                .fontWeight(.semibold)
            Spacer()
            Text(amount)
                .opacity(0.5)
        }
        .padding(.vertical, 8)
        
        Divider()
            .background(.white)
    }
}

#Preview {
    MoonPhaseView(description: "밝은 면", amount: "74%")
}
