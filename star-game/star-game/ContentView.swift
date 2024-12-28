//
//  ContentView.swift
//  star-game
//
//  Created by Elizabeth Trenholme on 12/14/24.
//

import SwiftUI


struct ContentView: View {
    @State var counter = 0
    @State var randomInt1 = Int.random(in: 0...15)
    @State var randomInt2 = Int.random(in: 0...15)
    @State var randomInt3 = Int.random(in: 0...15)
    @State var randomInt4 = Int.random(in: 0..<10)
    @State var goalNumber = Int.random(in: 50...200)
    @State var wins = 0
    @State var losses = 0
    @State var resultMesssage: String = ""
    @State var textDisplay = ""
    var body: some View {
        
        VStack {
            ZStack {
                VStack {
                    Spacer()

                    Text("Star Collector")
                        .font(.custom("kongtext", size: 26))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Spacer()
                    VStack() {
                        Text("A random number is assigned at the start of the game, and it is up to you to match that goal by clicking on the different stars in order to gain mystical numbers that add to your score! Beware... you must match the score number to the goal number exactly, or the Martians will destroy planet Earth!|")
//                        Text(textDisplay)
                    }
                    .padding([.top, .leading, .trailing], 10.0)
                    .font(.custom("kongtext", size: 16))
                    .fontWeight(.light)
                        .foregroundColor(Color.white)
                    Spacer()
                    Text(resultMesssage)
                        .font(.custom("kongtext", size: 26))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 0.153, saturation: 0.293, brightness: 1.0))
                        .multilineTextAlignment(.center)
                    Spacer()
                    VStack {
                        Text("Score: ")
                        Text("\(counter)")
                    }
                    .font(.custom("kongtext", size: 18))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                    HStack {
                        VStack {
                            Text("Goal: ")
                            Text(String(goalNumber))
                        }
                        VStack {
                            Text("Wins: ")
                            Text(String(wins))
                        }
                        VStack {
                            Text("Losses: ")
                            Text(String(losses))
                        }
                    }.font(.custom("kongtext", size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                    Spacer()
                    HStack {
                        Button {
                            trackMainNum(mainNum: randomInt1)
                        } label: {
                            Image("blackstar")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .leading, .trailing])
//                                .background(Color.white)
//                                .opacity(0.7)
                            
                        }
                        Button {
                            trackMainNum(mainNum: randomInt2)
                        } label: {
                            Image("redstar")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
//                                .padding([.top, .leading, .trailing]).background(Color.white)
//                                .opacity(0.7)
                        }
                        Button {
                            trackMainNum(mainNum: randomInt3)
                        } label: {
                            Image("greenstar")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .leading, .trailing], 1.0)
//                                .background(Color.white)
//                                .opacity(0.7)
                        }
                        Button {
                            trackMainNum(mainNum: randomInt4)
                        } label: {
                            Image("yellowstar")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .leading, .trailing])
//                                .background(Color.white)
                                .opacity(0.3)
                        }
                    }.background(Color.white)
                        .cornerRadius(10)
                        .opacity(0.8)
                }
                Spacer()
            }
            Spacer()
        }.background(
            Image("martianchroniclesmobile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .background(Color.black)
        )
    }
    func incrementWins() {
        wins += 1
    }
    func incrementLosses() {
        losses += 1
    }
    func trackMainNum(mainNum: Int) {
        // add main to counter, check if equeal to, under or over goal number and return accordingly
        let updatedNum = mainNum + counter
        if updatedNum == goalNumber {
            resultMesssage = "Yay, you've saved the planet!"
            incrementWins()
            resetGame()
        } else if updatedNum > goalNumber {
            resultMesssage = "Oh noes, the planet has been destroyed!"
            incrementLosses()
            resetGame()
        } else if updatedNum < goalNumber {
            resultMesssage = ""
            counter = updatedNum
        }
    }
    func resetGame () {
        counter = 0
        goalNumber = Int.random(in: 50...200)
//        resultMesssage = ""
        randomInt1 = Int.random(in: 1...15)
        randomInt2 = Int.random(in: 1...15)
        randomInt3 = Int.random(in: 1...15)
        randomInt4 = Int.random(in: 1...15)
    }
    func setTyping(characterDelay: TimeInterval = 5.0) {
        let text = "A random number is assigned at the start of the game, and it is up to you to match that goal by clicking on the different stars in order to gain mystical numbers that add to your score! Beware... you must match the score number to the goal number exactly, or the Martians will destroy planet Earth!|"
      textDisplay = ""
    
      let writingTask = DispatchWorkItem {
        text.forEach { char in text
          DispatchQueue.main.async {
            textDisplay.append(char)
          }
          Thread.sleep(forTimeInterval: characterDelay/100)
        }
      }
        
      let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
      queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

#Preview {
    ContentView()
}
