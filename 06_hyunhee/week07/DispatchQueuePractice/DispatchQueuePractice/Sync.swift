//
//  Sync.swift
//  DispatchQueuePractice
//
//  Created by lee hyunhee on 5/13/24.
//

import SwiftUI

struct Sync: View {
    @State private var result = 0
    
    var body: some View {
        HStack {
            Text(String(result))
        }
        
        Button("do sync task") {
            DispatchQueue.global().sync {
                var subResult = result
                for i in 1...10000 {
                    subResult += 1
                }
                result = subResult
            }
            DispatchQueue.global().sync {
                var subResult = result
                for i in 1...10000 {
                    subResult += 1
                }
                result = subResult
            }
        }        
        Button("do async task") {
            DispatchQueue.global().async {
                var subResult = result
                for i in 1...10000 {
                    subResult += 1
                }
                result = subResult
            }
            DispatchQueue.global().async {
                var subResult = result
                for i in 1...10000 {
                    subResult += 1
                }
                result = subResult
            }
        }
    }
    
    func syncTask() {
    }
}

#Preview {
    Sync()
}
