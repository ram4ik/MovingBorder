//
//  ContentView.swift
//  MovingBorder
//
//  Created by test on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isMovingAround = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 27)
                .frame(width: 160, height: 54)
                .foregroundStyle(.indigo.gradient)
            RoundedRectangle(cornerRadius: 27)
                .strokeBorder(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, dash: [40, 400], dashPhase: isMovingAround ? 220 : -220))
                .frame(width: 160, height: 54)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .white, .purple, .mint, .white, .orange, .indigo]), startPoint: .trailing, endPoint: .leading))
                .shadow(radius: 2)
            Button {
                
            } label: {
                ZStack {
                    HStack {
                        Text("Get Started")
                        Image(systemName: "arrow.right")
                    }
                    .bold()
                }
            }
            .buttonStyle(.plain)
        }
        .onAppear() {
            withAnimation(.linear.speed(0.1).repeatForever(autoreverses: false)) {
                isMovingAround.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
