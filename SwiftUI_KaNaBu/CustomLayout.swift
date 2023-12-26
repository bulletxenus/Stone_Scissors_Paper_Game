//
//  CustomLayout.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import Foundation
import SwiftUI

struct CustomLayout: View {
    @Binding var isPresented: Bool
    var state: RoundState
    var onPress: () -> Void
    
    var message: String {
        switch state {
        case .draw:
            return "The round is finished in draw"
        case .win:
            return "You've win the round"
        case .loose:
            return "You've loose the round"
        }
    }
    
    private var gradientColorsCollection: Color {
        switch state {
            case .draw:
            return Color(red:0.27843, green:0.00000, blue:1.00000)
            case .loose:
            return Color(red:1.00000, green:0.00000, blue:0.14902)
            case .win:
            return Color(red:0.00000, green:0.57255, blue:0.00000)
        }
        
    }
        
    
    var body: some View {
        if isPresented {
            ZStack {
                RoundedRectangle(cornerRadius: 30).fill(RadialGradient(colors: [gradientColorsCollection, .black], center: .center, startRadius: 0, endRadius: 800))
                    .ignoresSafeArea()
                    .opacity(0.5)
                VStack(alignment: .center) {
                    Text(message)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Button {
                        onPress()
                        isPresented = false
                    } label: {
                        Image(systemName: "arrow.forward.circle.fill")
                            .font(.system(size: 50))
                    }
                    .padding(10)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                }
                .frame(width: 400, height: 500)
                .foregroundColor(.white)
                
            }
            .onTapGesture {
                print($0)
            }
            .zIndex(2)
        }
    }
}
