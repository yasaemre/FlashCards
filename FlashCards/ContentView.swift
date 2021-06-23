//
//  ContentView.swift
//  FlashCards
//
//  Created by Emre Yasa on 6/15/21.
//

import SwiftUI
import Firebase


struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1

    private var walkthrough = WalkthroughView()
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    //@State var appleLogStatus = UserDefaults.standard.value(forKey: "appleLogStatus") as? Bool ?? false
    var body: some View {
        if currentPage > totalPages {
            Home()
        } else {
            walkthrough
        }
    }
}
struct Home : View {
    
    @State var show = false
    @AppStorage("appleLogStatus") var appleLogStatus = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false

    var body: some View{
        
        NavigationView{
            
            VStack{
                
                if self.status || self.appleLogStatus{
                    
                    Homescreen()
                }
                else{
                    
                    ZStack{
                        
                        NavigationLink(destination: SignUpView(show: self.$show), isActive: self.$show) {
                            
                            Text("")
                        }
                        .hidden()
                        
                        LoginView(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("appleLogStatus"), object: nil, queue: .main) { (_) in
                    
                    self.appleLogStatus = UserDefaults.standard.value(forKey: "appleLogStatus") as? Bool ?? false
                }
            }
        }
    }
}

struct Homescreen : View {
    
    var body: some View{
        
        VStack{
            
            Text("Logged successfully")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Button(action: {
                
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                UserDefaults.standard.set(false, forKey: "appleLogStatus")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("appleLogStatus"), object: nil)
                
            }) {
                
                Text("Log out")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

