//
//  ContentView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WalkthroughScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
struct Home: View {
    var body: some View {
        Text("Welcome to Home!")
            .font(.title)
            .fontWeight(.heavy)
    }
}


struct WalkthroughScreen:View {
    var body: some View {
        
        //Slide animation
        VStack(spacing: 20) {
            HStack {
//                Text("Hello Member!")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                // Letter spacing
//                    .kerning(1.4)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                }
            }
            .foregroundColor(.black)
            .padding()
            
            //Spacer(minLength: 0)
            
            Image("FlashCards")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Welcome to FlashCards")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)
            
            Text("With FlashCards, you create your own deck, and sync with Mac, and then you can use them on iPhone and Mac concurrently.")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
                //Min spacing when Phone is reducing
            Spacer(minLength: 100)
        }
        .overlay(
            //Button
            Button(action: {}, label: {
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            //Circular Slider..
                .overlay(
                    ZStack{
                    
                    Circle()
                        .stroke(Color.black.opacity(0.04), lineWidth: 4)
                        
                    Circle()
                        .trim(from: 0, to: 0.3)
                        .stroke(Color.white, lineWidth: 4)
                        .rotationEffect(.init(degrees: -90))
                }
                        .padding(-15)
                )
        })
            ,alignment: .bottom
        )
    }
}
