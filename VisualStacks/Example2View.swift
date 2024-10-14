//
//  Example2View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct Example2View: View {
    @State private var horizontalAlignment: HAlignment = .center
    @State private var verticalAlignment: VAlignment = .center
    @State private var selectedGrid: Int = 22
    @State private var alsoAlignFrame = false
    @State private var isShowingPopover = false
    
    var body: some View {
        ZStack {
            VStack(alignment: horizontalAlignment.alignment, spacing: 16, content: {
                Image(systemName: "square.3.layers.3d")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.tint)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.")
                    .foregroundStyle(Color.black)
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
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: frameAlignment())
            
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    
                    Text("Content alignment")
                    
                    Grid(horizontalSpacing: 2,
                         verticalSpacing: 2, content: {
                        ForEach(1..<4, content: { i in
                            GridRow {
                                ForEach(1..<4, content: { j in
                                    if alsoAlignFrame {
                                        // we aligning the vstack content as well
                                        // as the frame
                                        gridButton(row: i, column: j)
                                        
                                    } else {
                                        // we are only aligning the vstack content
                                        // this means we only display 3 grids
                                        if i == 2 {
                                            gridButton(row: i, column: j)
                                        }
                                    }
                                })
                            }
                        })
                    })
                    .padding(.all, 2)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    HStack {
                        Toggle(isOn: $alsoAlignFrame, label: {
                            Text("Also align frame")
                                .foregroundStyle(Color.black)
                        }).onChange(of: alsoAlignFrame, perform: { value in
                            if verticalAlignment == .top || verticalAlignment == .bottom {
                                selectedGrid = 20 + horizontalAlignment.rawValue
                                verticalAlignment = .center
                            }
                        })
                        

                        Button(action: {
                            self.isShowingPopover = true
                        }, label: {
                            Image(systemName: "info.circle")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                        })
                        .labelStyle(.iconOnly)
                        .buttonStyle(.borderless)
                        .popover(isPresented: $isShowingPopover) {
                            Text("When checked, VStack's and frame alignments are set to be identical. When not checked")
                                .padding()
                        }
                    }
                    
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
    
    private func frameAlignment() -> Alignment {
        if alsoAlignFrame {
            
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
        } else {
            return .center
        }
    }
}

#Preview {
    Example2View()
}
