//
//  NextView.swift
//  ThirdApp
//
//  Created by lee hyunhee on 4/2/24.
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
