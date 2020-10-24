//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Paul Yi on 10/23/20.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Text("St. Luke's")
            .titleStyle()
    }
}

// 1. Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
struct Title: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font(.system(size: 45, weight: .heavy, design: .default))
            .foregroundColor(.blue)
            .padding()
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



