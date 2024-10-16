//
//  Example2View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct Example4View: View {
    @State private var horizontalAlignment: HAlignment = .center
    @State private var verticalAlignment: VAlignment = .center
    @State private var selectedGrid: Int = 22
    private let reversedColorPalette: [Color] = Color.viridisPalette.reversed()
    
    var body: some View {
        ZStack {
            ZStack(alignment: combinedAlignment) {
                ForEach(0..<Color.viridisPalette.count, id: \.self) { index in
                    let shapeWidth =  CGFloat(300 - (index * 20))
                    let shapeHeight = CGFloat(240 - (index * 20))
                    
                    Rectangle()
                        .fill(reversedColorPalette[index])
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .frame(width: shapeWidth, height: shapeHeight)
                }
            }
            
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    
                    Text("ZStack alignment")
                    
                    Grid(horizontalSpacing: 2,
                         verticalSpacing: 2, content: {
                        ForEach(1..<4, content: { i in
                            GridRow {
                                ForEach(1..<4, content: { j in
                                    gridButton(row: i, column: j)
                                })
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
    
    private func gridButton(row: Int, column: Int) -> some View {
        let currentGridCoordinates = (10 * row) + column
        let cellColor = selectedGrid == currentGridCoordinates ? Color.red : Color.gray
        
        return Rectangle()
            .tag(currentGridCoordinates)
            .frame(width: 24, height: 24)
            .foregroundStyle(cellColor)
            .onTapGesture {
                horizontalAlignment = HAlignment(rawValue: column)!
                verticalAlignment = VAlignment(rawValue: row)!
                selectedGrid = currentGridCoordinates
            }
    }
    
    private var combinedAlignment: Alignment {
        switch horizontalAlignment {
        case .leading:
            switch verticalAlignment {
            case .top:
                return .topLeading
            case .center:
                return .leading
            case .bottom:
                return .bottomLeading
            }
        case .center:
            switch verticalAlignment {
            case .top:
                return .top
            case .center:
                return .center
            case .bottom:
                return .bottom
            }
        case .trailing:
            switch verticalAlignment {
            case .top:
                return .topTrailing
            case .center:
                return .trailing
            case .bottom:
                return .bottomTrailing
            }
        }
    }
}

#Preview {
    Example4View()
}
