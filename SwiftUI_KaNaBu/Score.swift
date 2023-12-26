//
//  Score.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import Foundation
import SwiftUI

struct Score: View {
    var appScore: Int
    var playerScore: Int
    
    var body: some View {
        VStack {
            Text("Score")
            Text("\(appScore):\(playerScore)")
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}
