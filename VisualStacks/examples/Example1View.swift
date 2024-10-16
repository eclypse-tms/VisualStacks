//
//  Example1View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct Example1View: View {
    @State private var coverScreen = false
    
    
    var body: some View {
        let content: String
        if coverScreen {
            content = "VStack is taking up the entire screen."
        } else {
            content = "VStack is only using the space it needs."
        }
        
        return ZStack {
            let vStack = VStack(spacing: 16, content: {
                Image(systemName: "square.3.layers.3d")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.tint)
                    .background(Color.white)
                Text(content)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
            })
            
            if coverScreen {
                vStack
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("background_blue"))
            } else {
                vStack
                    .background(Color("background_blue"))
            }
            
            
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()

                    HStack {
                        Toggle(isOn: $coverScreen, label: {
                            Text("Cover entire screen")
                        })
                    }
                    
                }
            }.padding([.bottom, .trailing], 8)
        }
    }
}

#Preview {
    Example1View()
}
