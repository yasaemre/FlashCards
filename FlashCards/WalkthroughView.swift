//
//  WalkthroughView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/15/21.
//

import SwiftUI

struct WalkthroughView:View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        //Slide animation
        ZStack{
            //Changing between views
            if currentPage == 1 {
                ScreenView(image: "FlashCards", title: "Welcome to FlashCards", detail: "With FlashCards, you create your own deck, and sync with Mac, and then you can use them on iPhone and Mac concurrently.")
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "deck", title: "Create Deck", detail: "You can create on a deck including words you want to study on Mac or iPhone. By doing so, your decks will be always updated through iCloud.")
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "study", title: "Study Deck", detail: "You can study decks swiping right and left. But just be careful, every correct answer counts. ")
                    .transition(.scale)
            }
            if currentPage == 4 {
                ScreenView(image: "sync", title: "Sync to Mac", detail: "You can create on a deck including words you want to study on Mac or iPhone. By doing so, your decks will be always updated through iCloud.")
                    .transition(.scale)
            }
        }
        .overlay(
            //Button
            Button(action: {
            withAnimation(.easeOut) {
                //checking..
                if currentPage <= totalPages {
                    currentPage += 1
                } else {
                    currentPage = 1
                }
            }
            
        }, label: {
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(hex: "5A80E1"))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            //Circular Slider..
                .overlay(
                    ZStack{
                    
                    Circle()
                        .stroke(Color.gray.opacity(0.4), lineWidth: 4)
                        
                    Circle()
                        .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                        .stroke(Color.init(hex: "5A80E1"), lineWidth: 4)
                        .rotationEffect(.init(degrees: -90))
                }
                        .padding(-15)
                )
        })
                .padding(.bottom, 20)
            ,alignment: .bottom
        )
    }
}



//total pages
var totalPages = 4
struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}
