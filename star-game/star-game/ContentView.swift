//
//  ContentView.swift
//  star-game
//
//  Created by Elizabeth Trenholme on 12/14/24.
//

//A random number is assigned at the start of the game, and it
//
//is up to you to match that goal by clicking on the different
//
//stars in order to gain mystical numbers that add to your
//
//score! Beware... you must match the score number to the goal
//
//number exactly, or the Martians will destroy planet Earth!|

import SwiftUI

//func setTyping(text: String, characterDelay: TimeInterval = 5.0) {
//  self.text = ""
//    
//  let writingTask = DispatchWorkItem { [weak self] in
//    text.forEach { char in
//      DispatchQueue.main.async {
//        self?.text?.append(char)
//      }
//      Thread.sleep(forTimeInterval: characterDelay/100)
//    }
//  }
    
  let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
  queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
}

struct ContentView: View {
    @State var counter = 0
    let randomInt1 = Int.random(in: 0..<9)
    let randomInt2 = Int.random(in: 0..<9)
    let randomInt3 = Int.random(in: 0..<9)
    let randomInt4 = Int.random(in: 0..<10)
    var body: some View {
        
        VStack {
            //          Button("Increase Count"){ counter += 1 }
            //          Button(action: { counter = counter - 1 }) {
            //            Image(systemName: "arrow.down")
            //          }
            //          .buttonStyle(.plain)
   
            ZStack {
//                Color(.systemBrown)
//                    .ignoresSafeArea()
                VStack {
                    Text("Star Collector")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("\(counter)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
//                    Image("martianchroniclesmobile")
//                        .resizable()
//                        .cornerRadius(10)
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.all)
                    HStack {
                        Button {
                            counter += randomInt1
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
                            counter += randomInt2
                        } label: {
                            Image("redstar")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
//                                .padding([.top, .leading, .trailing]).background(Color.white)
//                                .opacity(0.7)
                        }
                        Button {
                            counter += randomInt3
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
                            counter += randomInt4
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
            }
        }.background(
            Image("martianchroniclesmobile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .background(Color.black)
        )
    }
}

#Preview {
    ContentView()
}

//struct ContentView:View{
//    var body:some View{
//     ImageView()
//    }
//}
struct ImageOverlay: View {
    var body: some View {
        VStack {
            Text("Credit: Ricardo Gomez Angel")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ImageView: View {
    var body: some View {
        VStack {
            Image("blackstar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(ImageOverlay(), alignment: .center)
            Spacer()
        }
    }
}
