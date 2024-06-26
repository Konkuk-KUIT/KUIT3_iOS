//
//  NextView.swift
//  Week3
//
//  Created by 가은 on 3/27/24.
//

import SwiftUI

struct NextView: View {
    @State var itemInfo: ItemInfo
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: itemInfo.imageName)
            Text(itemInfo.name)
            Text(value)
        }
        .onAppear(
            perform: {
                value = "change"
            }
        )
    }
}

//#Preview {
//    NextView()
//}
