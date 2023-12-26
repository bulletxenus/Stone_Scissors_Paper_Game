//
//  Hint.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import Foundation
import SwiftUI

struct Hint: View {
    var isWin: Bool
    
    init(condition isWin: Bool) {
        self.isWin = isWin
    }
    
    var body: some View {
        VStack {
            Text("You should")
                .foregroundStyle(.white)
                .font(.headline)
            Text(isWin ? "Win" : "Loose")
                .foregroundStyle(isWin ? .green : .blue)
                .font(.custom("Roboto", size: 50))
        }
    }
}
