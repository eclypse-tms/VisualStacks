//
//  Example2View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI
import Polygon

struct Example5View: View {
    @State private var verticalAlignment: VAlignment = .center
    @State private var selectedGrid: Int = 2
    
    var body: some View {
        ZStack {
            
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                Spacer()
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                Spacer()
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                
            }.frame(width: 420, height: 130)
                
            
            HStack(alignment: alignment()) {
                Rectangle()
                    .frame(width: 90, height: 90)
                    .foregroundColor(Color.red)
                Circle()
                    .frame(width: 32)
                    .foregroundColor(Color.orange)
                Ellipse()
                    .frame(width: 72, height: 128)
                    .foregroundColor(Color.yellow)
                Capsule()
                    .frame(width: 72, height: 42)
                    .foregroundColor(Color.green)
                Polygon(numberOfSides: 6)
                    .rotationAngle(Angle(degrees: 90))
                    .borderWidth(0)
                    .frame(width: 72, height: 72)
            }
            
            
            
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    
                    Text("Content alignment")
                    
                    Grid(horizontalSpacing: 1,
                         verticalSpacing: 1, content: {
                        ForEach(1..<4, content: { i in
                            GridRow {
                                gridButton(row: i)
                            }
                        })
                    })
                    .padding(.all, 2)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }.padding([.bottom, .trailing], 8)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background_gray"))
        
    }
    
    private func gridButton(row: Int) -> some View {
        
        let cellColor = selectedGrid == row ? Color.red : Color.gray
        
        return Rectangle()
            .tag(row)
            .frame(width: 60, height: 24)
            .foregroundStyle(cellColor)
            .onTapGesture {
                verticalAlignment = VAlignment(rawValue: row)!
                selectedGrid = row
            }
    }
    
    private func alignment() -> VerticalAlignment {
        switch verticalAlignment {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
}

#Preview {
    Example5View()
}
