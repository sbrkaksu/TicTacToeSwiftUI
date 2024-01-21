//
//  shapeX.swift
//  TicTacToe
//
//  Created by Berk Aksu on 21.01.2024.
//

import SwiftUI

struct X: Shape {
    var directionX: Double
    var directionY: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatableData(directionX, directionY) }
        set { directionX = newValue.first
            directionY = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: directionX, y: directionY))
        
        return path
    }
}

struct shapeX: View {
    @State private var directionX = 0.0
    @State private var directionY = 0.0
    @State private var isClicked = false
    
    var body: some View {
        VStack{
            X(directionX: directionX, directionY: directionY)
                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 40 , height: 50)
                .opacity(isClicked ? 1 : 0)
                .border(.black)
                .padding()
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.2)){
                directionX += 40
                directionY += 50
            }
            isClicked.toggle()
            print(String(describing: isClicked))
        }
    }
}

struct shapeX_Previews: PreviewProvider {
    static var previews: some View {
        shapeX()
    }
}
