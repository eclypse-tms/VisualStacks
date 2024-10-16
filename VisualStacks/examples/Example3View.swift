//
//  Example3View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct Example3View: View {
    @State private var spacerLocation: SpacerLocation = .notPresent
    
    var body: some View {
        ZStack {
            
            HStack {
                if spacerLocation == .left {
                    Spacer()
                }
                VStack(spacing: 16, content: {
                    if spacerLocation == .top {
                        Spacer()
                    }
                    Image(systemName: "square.3.layers.3d")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.tint)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.")
                        .multilineTextAlignment(.center)
                    HStack {
                        Circle()
                            .frame(width: 24)
                            .foregroundColor(Color.red)
                        Circle()
                            .frame(width: 24)
                            .foregroundColor(Color.orange)
                        Circle()
                            .frame(width: 24)
                            .foregroundColor(Color.yellow)
                        
                    }
                    if spacerLocation == .bottom {
                        Spacer()
                    }
                })
                if spacerLocation == .right {
                    Spacer()
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    
                    Text("Spacer location")
                    
                    Grid(horizontalSpacing: 0,
                         verticalSpacing: 0, content: {
                        ForEach(1..<5, content: { i in
                            GridRow {
                                ForEach(1..<5, content: { j in
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
        
        var shouldSkipGrid = true
        if convert(gridCoordinates: currentGridCoordinates) != .notPresent {
            shouldSkipGrid = false
        }
        
        let cellColor: Color
        if shouldSkipGrid {
            cellColor = Color.white
        } else {
            switch spacerLocation {
            case .notPresent:
                cellColor = Color.gray
            case .top:
                if row == 1 {
                    cellColor = Color.red
                } else {
                    cellColor = Color.gray
                }
            case .right:
                if column == 4 {
                    cellColor = Color.red
                } else {
                    cellColor = Color.gray
                }
            case .bottom:
                if row == 4 {
                    cellColor = Color.red
                } else {
                    cellColor = Color.gray
                }
            case .left:
                if column == 1 {
                    cellColor = Color.red
                } else {
                    cellColor = Color.gray
                }
            }
        }
        
        return Rectangle()
            .frame(width: 24, height: 24)
            .foregroundStyle(cellColor)
            .onTapGesture {
                if shouldSkipGrid {
                    spacerLocation = .notPresent
                } else {
                    if convert(gridCoordinates: currentGridCoordinates) == .top {
                        if spacerLocation == .top {
                            spacerLocation = .notPresent
                        } else {
                            spacerLocation = .top
                        }
                    } else if convert(gridCoordinates: currentGridCoordinates) == .left {
                        if spacerLocation == .left {
                            spacerLocation = .notPresent
                        } else {
                            spacerLocation = .left
                        }
                    } else if convert(gridCoordinates: currentGridCoordinates) == .right {
                        if spacerLocation == .right {
                            spacerLocation = .notPresent
                        } else {
                            spacerLocation = .right
                        }
                    } else if convert(gridCoordinates: currentGridCoordinates) == .bottom {
                        if spacerLocation == .bottom {
                            spacerLocation = .notPresent
                        } else {
                            spacerLocation = .bottom
                        }
                    }
                }
            }
        
    }
    
    private func convert(gridCoordinates: Int) -> SpacerLocation {
        if gridCoordinates == 12 || gridCoordinates == 13 {
            return .top
        } else if gridCoordinates == 21 || gridCoordinates == 31 {
            return .left
        } else if gridCoordinates == 24 || gridCoordinates == 34 {
            return .right
        } else if gridCoordinates == 42 || gridCoordinates == 43 {
            return .bottom
        } else {
            return .notPresent
        }
    }
}

#Preview {
    Example3View()
}

