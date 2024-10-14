//
//  ContentView.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, content: {
                    Text("Demonstrates how to cover the entire screen")
                    NavigationLink(destination: {
                        Example1View()
                    }, label: {
                        Text("Go")
                    })
                })
                HStack(alignment: .center, content: {
                    Text("Demonstrates how to align the contents to top/right/bottom/left of the screen")
                    NavigationLink(destination: {
                        Example2View()
                    }, label: {
                        Text("Go")
                    })
                })
                HStack(alignment: .center, content: {
                    Text("Demonstrates how to use Spacers to align the contents")
                    NavigationLink(destination: {
                        Example3View()
                    }, label: {
                        Text("Go")
                    })
                })
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ContentView()
}