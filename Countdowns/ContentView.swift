//
//  ContentView.swift
//  Countdowns
//
//  Created by Kyle Edwards on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    let countdowns: [[String: String]] = [
        [
            "name":"Birthday",
            "visible": "true",
            "expanded": "false"
        ],
        [
            "name":"Christmas",
            "visible": "true",
            "expanded": "false"
        ]
    ]
    
    let date = Date()
    
    var body: some View {
        ZStack() {
            Color.black
                .ignoresSafeArea()
            VStack() {
                Text("COUNTDOWN")
                    .font(.custom("Menlo:", size: 50.0))
                    .foregroundColor(.white)
                    .padding(30)
                Spacer()
            }
            VStack() {
                ForEach(0..<countdowns.count) { countdown in
                    if countdowns[countdown]["visible"] == "true" {
                        Button(action: {
                            print("hey")
                        }, label: {
                            Text("\(countdowns[countdown]["name"]!)     ↓")
                                .foregroundColor(.white)
                                .font(.custom("Menlo", size: 35.0))
                                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                        })
                        Divider()
                            .background(Color.white).padding(20).frame(width: 150, height: 20)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func log(_ text: String) -> EmptyView {
    print("** \(text)")
    return EmptyView()
}
