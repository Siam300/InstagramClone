//
//  ComponentsView.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct ComponentsView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView(value: 1, title: "Following")
    }
}
