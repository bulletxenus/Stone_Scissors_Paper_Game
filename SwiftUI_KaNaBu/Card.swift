//
//  Card.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import Foundation
import SwiftUI

struct Card: View {
    var image: String
    var selected: Bool
    var onPress: (() -> Void)?
    
    var body: some View {
        Button {
            // onPress
            onPress?()
        } label: {
            Image(image)
                .resizable()
                .frame(width: 70, height: 70)
                
        }
        .disabled(onPress == nil ? true : false)
        .scaleEffect(CGSize(width: selected ? 1.2 : 1.0, height: selected ? 1.2 : 1.0))
        .padding()
    }
}
