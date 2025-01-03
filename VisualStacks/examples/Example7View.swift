//
//  Example7View.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct Example7View: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .frame(width: 210, height: 150)
                .foregroundColor(Color.green)
            
            Ellipse()
                .frame(width: 180, height: 90)
                .foregroundColor(Color.purple)
            
            Circle()
                .frame(width: 48)
                .foregroundColor(Color.yellow)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background_gray"))
    }
}

#Preview {
    Example7View()
}
