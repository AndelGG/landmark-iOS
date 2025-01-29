//
//  SwiftUIView.swift
//  PyHub
//
//  Created by Дмитрий Поповский on 2025-01-27.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("shpack")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
