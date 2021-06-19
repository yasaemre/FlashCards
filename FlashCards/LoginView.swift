//
//  LoginView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/17/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State private var email = ""
    @State private var pass = ""
    @State private var isVisible = false
    @Binding var show:Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {

            Color.init(hex: "5A80E1").ignoresSafeArea()
            .overlay(
                VStack(alignment: .center, spacing: 20) {
                    GeometryReader { geo in
                        Image("welcome")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width, height:geo.size.height)
                    }
                    Spacer()

                    Button(action: {
                        print("Apple button was tapped")
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
                    print("Google button was tapped")
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
                    print("Facebook button was tapped")
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
                
//                Text("OR")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)

                TextField(
                    "Email",
                    text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                    .foregroundColor(.white)
                
                HStack(spacing: 15) {
                    
                    VStack {
                        if self.isVisible {
                            TextField("Password", text: self.$pass)
                        } else {
                            SecureField("Password", text: self.$pass)
                        }
                    }
                    .foregroundColor(.white)
                    Button(action: {
                        self.isVisible.toggle()
                    }) {
                        Image(systemName: self.isVisible ? "eye.slash.fill" : "eye.fill").foregroundColor(self.color)
                    }

                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                //.padding(.top)
                   
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Forget password")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                    }
                }
                
                HStack(spacing: 30) {
                    
                    Button(action: {
                        print("Login button was tapped")
                        self.verify()
                    }) {
                        Text("Login")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                    }
                    .frame(width: 100, height: 40, alignment: .center)
                    .background(Color.init(hex: "6C63FF"))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    
                    Button(action: {
                        print("Register button was tapped")
                        self.show.toggle()
                    }) {
                        Text("Register")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                    }
                    .frame(width: 100, height: 40, alignment: .center)
                    .background(Color.init(hex: "6C63FF"))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                }
                
                Text("Continue without sign in")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                 
                
            }
                    .padding(.horizontal, 25)
                
             
                
                
            )
        if self.alert {
            ErrorView(alert: self.$alert, error: self.$error)
                .frame(width: 300, height: 150, alignment: .center)
                .opacity(0.9)
        }
    
    }
    func continueWithApple() {
        print("dsf")
    }
    
    func verify() {
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { res, error in
                if let error = error {
                    self.error = error.localizedDescription
                    self.alert.toggle()
                    return
                }
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
        
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(show: .constant(false))
    }
}
