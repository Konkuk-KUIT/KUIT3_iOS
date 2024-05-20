//
//  People.swift
//  Animation
//
//  Created by lee hyunhee on 5/13/24.
//

import SwiftUI

struct People: View {
    @State private var peoples : [PeopleProp] = []
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(peoples) { people in
                    people
                }
            }
            
            Spacer()
            HStack {
                Button("+") {
                    addPeople()
                }
                Button("-") {
                    removePeople()
                }
            }
        }
    }
    
    func addPeople() {
        peoples.append(PeopleProp())
    }
    
    func removePeople() {
        peoples.removeLast()
    }
}

struct PeopleProp: View, Identifiable {
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    var id = UUID()
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .frame(width: 30, height: 30)
                .position(x:x, y:y)
                .animation(.linear(duration: 1), value: x)
                .animation(.linear(duration: 1), value: y)
                .onAppear {
                    changeDestination(width: geometry.size.width, height: geometry.size.height)
                }
        }
    }
    
    func changeDestination(width: CGFloat, height: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            x = Double.random(in: 0...width)
            y = Double.random(in: 0...height)
            changeDestination(width: width, height: height)
        }
    }
}

#Preview {
    People()
}
