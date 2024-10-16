//
//  Example1View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI
import Polygon

struct Example6View: View {
    
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(3..<31, content: { index in
                        let quotientAndRemainder = index.quotientAndRemainder(dividingBy: Color.plasmaPalette.count)
                        
                        HStack {
                            Text("Sides: \(index)")
                            
                            Polygon(numberOfSides: (index))
                                .borderWidth(0)
                                .fillColor(Color.plasmaPalette[quotientAndRemainder.remainder])
                                .frame(width: 72, height: 72)
                        }
                    })
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    Example6View()
}
