//
//  Background.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import Foundation
import SwiftUI

struct Background: View {
    var body: some View {
        VStack(spacing: 0) {
            RadialGradient(stops: [
                .init(color: Color(red: 0.57647, green: 0.10196, blue: 0.10196), location: 0.3),
                .init(color: Color(red: 0.08627, green: 0.01569, blue: 0.44314), location: 0.3)
            ], center: .topLeading, startRadius: 250, endRadius: 270)
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.57647, green: 0.10196, blue: 0.10196), location: 0.3),
                .init(color: Color(red: 0.08627, green: 0.01569, blue: 0.44314), location: 0.3)
            ], center: .bottom, startRadius: 230, endRadius: 250)
        }
        .ignoresSafeArea()
    }
}
