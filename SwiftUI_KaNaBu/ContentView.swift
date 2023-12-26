//
//  ContentView.swift
//  SwiftUI_KaNaBu
//
//  Created by Dzmitry Khamitsevich on 9.12.23.
//

import SwiftUI

struct ContentView: View {
    private let maxRoundCount = 9
    private let type = ["scissors", "rock", "paper"]
    private let logicConstruct: [Int: Int] = [
        0: 1,
        1: 2,
        2: 0
    ]
    
    @State private var isWin = true
    @State private var appSelectedCardIndex = 3
    @State private var playerSelectedCardIndex = 3
    @State private var showModal = true // change
    @State private var showModal2 = false
    @State private var isGameFinished = false
    @State private var roundCount = 0
    @State private var roundState: RoundState = .draw
    @State private var score = [0,0]
    
    func onPressHandler(idx: Int) {
        playerSelectedCardIndex = idx
        
        if playerSelectedCardIndex == appSelectedCardIndex {
            roundState = .draw
        } else if (logicConstruct[appSelectedCardIndex] == idx && isWin)
                    || (logicConstruct[appSelectedCardIndex] != idx && !isWin) {
            roundState = .win
            score[1] += 1
        } else {
            roundState = .loose
            score[0] += 1
            
        }
        showModal2 = true
    }
    
    func resetGame() {
        appSelectedCardIndex = 3
        playerSelectedCardIndex = 3
        showModal = true
        showModal2 = false
        roundCount = 0
        score = [0, 0]
        
    }
    
    func finishGame() {
        showModal = true
//        resetGame()
    }
    
    func checkIsGameFinished() {
        print(roundCount >= maxRoundCount)
        if roundCount >= maxRoundCount {
            isGameFinished = true
            finishGame()
        } else {
            resetRoundState()
            startRound()
        }
    }
    
    func resetRoundState() {
        playerSelectedCardIndex = 3
    }
    
    func startRound() {
        isWin = Bool.random()
        appSelectedCardIndex = Int.random(in: 0...2)
        roundCount += 1
    }
    
    var body: some View {
        ZStack {
            CustomLayout(isPresented: $showModal2, state: roundState, onPress: checkIsGameFinished)
            
            Background()
            
            VStack {
                Text("Application")
                    .font(.custom("Roboto", size: 40))
                    .foregroundStyle(.white)
                Spacer(minLength: 200)
                HStack {
                    VStack {
                        HStack {
                            ForEach(0..<3) { idx in
                                Card(image: type[idx], selected: appSelectedCardIndex == idx)
                                
                            }
                        }
                        Spacer()
                        
                        Hint(condition: isWin)
                    
                        Spacer()
                        HStack {
                            ForEach(0..<3) { idx in
                                Card(image: type[idx], selected: playerSelectedCardIndex == idx) {
                                    onPressHandler(idx: idx)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Score(appScore: score[0], playerScore: score[1])
                }
                
                Spacer(minLength: 200)
                
                Text("Player")
                    .font(.custom("Roboto", size: 40))
                    .foregroundStyle(.white)
                
            }
            .padding()
            .alert(isGameFinished ? "Game Finished" : "Welcome", isPresented: $showModal) {
                Button {
                    if isGameFinished {
                        resetGame()
                    }
                        startRound()
                    
                    
                } label: {
                    Text("Start game")
                }
            } message: {
                VStack {
                    if isGameFinished {
                        Text("""
                            You win/loose the game
                            App: \(score[0]):\(score[1]) :Player
                            """
                        )
                   
                    }
                    Text("Would you start new game?")
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
