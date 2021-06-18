//
//  LoginView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/17/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    var body: some View {

            Color.init(hex: "5A80E1").ignoresSafeArea()
            .overlay(
                VStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        HStack(spacing: 40) {
                            Image("apple")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                
                                Text("Continue with Apple")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                        }
                        
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .border(Color.white, width: 2)
                    .cornerRadius(25)
                    
                
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    HStack(spacing: 40) {
                        Image("google")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            
                            Text("Continue with Apple")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
                    }
                    
                }
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.white)
                .foregroundColor(.black)
                .border(Color.white, width: 2)
                .cornerRadius(25)
                
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    HStack(spacing: 40) {
                        Image("fb")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            
                            Text("Continue with Apple")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
                    }
                    
                }
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.white)
                .foregroundColor(.black)
                .border(Color.white, width: 2)
                .cornerRadius(25)
                
                Text("OR")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                VStack {
                       TextField(
                           "Given Name",
                            text: $givenName)
                           .disableAutocorrection(true)
                           .cornerRadius(25)
                       TextField(
                           "Family Name",
                           text: $familyName)
                           .disableAutocorrection(true)
                           .cornerRadius(25)
                   }
                .frame(width: 300, height: 50, alignment: .center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("OR")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("Continue without sign in")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                }
                
             
                
                
            )
    }
    func continueWithApple() {
        print("dsf")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
