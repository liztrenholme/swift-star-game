//
//  ContentView.swift
//  star-game
//
//  Created by Elizabeth Trenholme on 12/14/24.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        
        VStack {
          Text("\(counter)")
//          Button("Increase Count"){ counter += 1 }
//          Button(action: { counter = counter - 1 }) {
//            Image(systemName: "arrow.down")
//          }
//          .buttonStyle(.plain)
        }
        ZStack {
            Color(.systemBrown)
                .ignoresSafeArea()
            VStack {
                Text("Star Collector")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                Image("martianchroniclesmobile")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                HStack {
                    Button {
                        counter += 1
                    } label: {
                        Image("blackstar")
                            .resizable()
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)

                    }
                    Button {
                        counter += 3
                    } label: {
                        Image("redstar")
                            .resizable()
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                    }
                    Button {
                        counter += 9
                    } label: {
                        Image("greenstar")
                            .resizable()
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                    }
                    Button {
                        counter += 2
                    } label: {
                        Image("yellowstar")
                            .resizable()
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
