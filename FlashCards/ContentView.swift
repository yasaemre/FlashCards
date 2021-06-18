//
//  ContentView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/15/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    private var loginView = LoginView()
    private var walkthrough = WalkthroughView()
    var body: some View {
        if currentPage > totalPages{
            loginView
        } else {
            walkthrough
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//






