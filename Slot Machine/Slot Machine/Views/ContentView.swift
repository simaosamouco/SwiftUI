//
//  ContentView.swift
//  Slot Machine
//
//  Created by Simão Neves Samouco on 30/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven","gfx-strawberry"]
    
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    @State private var showingModel: Bool = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModel: Bool = false
    
    // MARK: - FUNCTIONS
    // SPIN THE REELS
    func spinReels() {
//        reels[0] = Int.random(in: 0...symbols.count - 1)
//        reels[1] = Int.random(in: 0...symbols.count - 1)
//        reels[2] = Int.random(in: 0...symbols.count - 1)
        
        reels = reels.map ({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    //CHECK THE WINNING
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            //PLAYER WINS
            playerWins()
            
            if coins > highScore {
                newHighscore()
            }
        } else {
            //PLAYER LOSES
            playerLoses()
        }
    }
    
    //PLAYER WINS
    func playerWins() {
            coins += betAmount * 10
    }
    
    //NEW HIGHSCORE
    func newHighscore() {
        highScore = coins
        UserDefaults.standard.set(highScore, forKey: "HighScore")
    }
    
    //PLAYER LOSES
    func playerLoses () {
        coins -= betAmount
    }
    
    func activateBet20() {
        isActiveBet20.toggle()
        isActiveBet10.toggle()
        betAmount = 20
    }
    func activateBet10() {
        isActiveBet20.toggle()
        isActiveBet10.toggle()
        betAmount = 10
    }
    //GAME OVER
    func isGameOver() {
        if coins <= 0 {
            //show model view
            showingModel = true
        }
    }
    
    func resetGame() {
        UserDefaults.standard.set(0, forKey: "HighScore")
        highScore = 0
        coins = 100
        activateBet10()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // MARK: -  BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color.colorPink, Color.colorPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
               
                // MARK: - HEADER
                LogoView()
                Spacer()
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                            
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }//:HSTACK
                    .modifier(scoreContainerModifier())
                    Spacer()
                    HStack {
                        Text("\(highScore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                            
                        
                    }//:HSTACK
                    .modifier(scoreContainerModifier())
                }//: HSTACK
                
                // MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5 ... 0.7)))
                            .onAppear(perform: {
                                self.animatingSymbol.toggle()
                            })
                    }
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                        ZStack {
                            // MARK: - REEL #2
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.7 ... 0.9)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
                        }
                        Spacer()
                        ZStack {
                            // MARK: - REEL #3
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.9 ... 1.1)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    
                    
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        withAnimation {
                            self.animatingSymbol = false
                        }
                        
                        //SPIN THE WHEELS with changing the symbols
                        self.spinReels()
                        
                        //trigger animation after changing the symbols
                        withAnimation {
                            self.animatingSymbol = true
                        }
                        
                        self.checkWinning()
                        self.isGameOver()
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                }//: SLOT MACHINE
                .layoutPriority(2)
                // MARK: - FOOTER
                
                HStack(alignment: .center, spacing: 10) {
                    HStack(alignment: .center, spacing: 10) {
                        // MARK: - BET 20
                        Button(action: {
                            print("bet 20 coins")
                            activateBet20()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color.colorYellow : Color.white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet20 ? 0 : 20)
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsModifiers())
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 10) {
                        // MARK: - BET 10
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet10 ? 0 : 20)
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifiers())
                        Button(action: {
                            print("bet 10 coins")
                            activateBet10()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color.colorYellow : Color.white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            // MARK: - BUTTONS
            .overlay(
                //RESET
                Button(action: {
                    print("reset the game")
                    self.resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            //INFO
            .overlay(
                Button(action: {
                    print("Info View")
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModel.wrappedValue ? 5 : 0, opaque: false)
            // MARK: - POPUP
            if $showingModel.wrappedValue {
                ZStack {
                    Color.colorTransparentBlack.edgesIgnoringSafeArea(.all)
                }
                
                //MODAL
                VStack( alignment: .center, spacing: 0) {
                    //TITLE
                    Text("GAME OVER")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.colorPink)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                    //MESSAGE
                    VStack(alignment: .center, spacing: 16) {
                          Image("gfx-seven-reel")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 72)
                        Text("Bad luck! You lost all of the coins. \nLet's play again")
                            .font(.system(.body, design: .rounded))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .layoutPriority(1)
                        
                        Button(action: {
                            self.showingModel = false
                            self.animatingModel = false
                            self.activateBet10()
                            self.coins = 100
                        }, label: {
                            Text("New Game".uppercased())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.semibold)
                                .accentColor(Color.pink)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(minWidth: 128)
                                .background(
                                    Capsule()
                                        .strokeBorder(lineWidth: 1.75)
                                        .foregroundColor(Color.colorPink)
                                )
                        })
                        
                    }
                    Spacer()
                        
                }.frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(
                        Color.white
                    )
                    .cornerRadius(20)
                    .shadow(color: Color.colorTransparentBlack, radius: 6, x: 0 ,y: 8)
                    .opacity($animatingModel.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModel.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear(perform: {
                        self.animatingModel = true
                    })
            }
            
        }//ZSTACK
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
        
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
