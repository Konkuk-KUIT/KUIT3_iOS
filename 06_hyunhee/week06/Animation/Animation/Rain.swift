//
//  Rain.swift
//  Animation
//
//  Created by lee hyunhee on 5/13/24.
//

import SwiftUI


struct Rain: View {
    @State private var rainDrops: [RainDrop] = []
    
    var body: some View {
        ZStack {
            ForEach(rainDrops) { drop in
                drop
            }
        }
        .onAppear {
            startRaining()
        }
    }
    
    func startRaining() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: 0.01...0.13)) {
            addRainDrop()
            startRaining()
        }
    }
    
    func addRainDrop() {
        let r = RainDrop()
        rainDrops.append(r)
        removeRainDrop(id: r.id, after: 1/r.scale*50 + 0.1)
    }
    
    private func removeRainDrop(id: UUID, after: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            guard let raindropPosition = rainDrops.firstIndex(where: { $0.id == id }) else { return }
            
            rainDrops.remove(at: raindropPosition)
        }
    }

}

struct RainDrop: View, Identifiable {
    var id = UUID()
    @State private var y = -0.2
    private var x: Double = .random(in: 0.01...0.99)
    var scale: Double = .random(in: 20...40)
    
    var body: some View {
        GeometryReader { screen in
            Rectangle()
                .frame(width: scale/8, height: scale)
                .foregroundStyle(.blue)
                .position(x: screen.size.width * x, y: screen.size.height * y)
                .onAppear() {
                    withAnimation(.easeIn(duration: 1/scale*50)) {
                        y = 1.2
                    }
                }
        }
    }
}

#Preview {
    Rain()
}
