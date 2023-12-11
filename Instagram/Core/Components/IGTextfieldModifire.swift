//
//  IGTextfieldModifire.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct IGTextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .padding(.top)
    }
}
