//
//  UsernameView.swift
//  practicle_DemoApp
//
//  Created by Ashish Raval on 03/08/21.
//
import SwiftUI

struct UsernameView: View {
    @State private var txtusername: String = ""
    @State private var isValid = false
    @State private var isValidMsg = false
    @State private var showingAlert = false

    let verticalPaddingForForm = 40
    
    var body: some View {
        
        NavigationView {

        ZStack (alignment: .top){
            Color(red: 20/225.0 ,green: 22/225.0 , blue: 25/225.0)
            
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                    .padding()
                Text("What's your name?")
                    .font(.title)
                VStack {
                    TextField("Enter your username", text: $txtusername)
                        .frame(minWidth: 0, maxWidth: 300)
                        .font(.system(size: 17))
                        .padding()
                    Divider()
                        .padding(.horizontal, 30)
                    
                }
                .background(Color(.white))
                
                
                Button("Continue") {
                     
                    // some validate code here like
                    if ((self.validView()) != nil){
                        self.showingAlert = true
                        isValid = false
                    }
                    else{
                        isValid = true
                        UserDefaults.standard.set(self.txtusername, forKey: "username")
                    }
                }
                .frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .font(.title)
                .background(
                    NavigationLink(destination: emailView(), isActive: $isValid) {  }
                )
                
                Spacer()
                
            }
            .padding(.horizontal, CGFloat(verticalPaddingForForm))
            .background(Color(.white))
            
            VStack{
                Spacer()
                Text("Designed for ZIGA Inc.")
                    .font(.system(size: 25))
                    .padding()
            }
            

        }
            
        
    }
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Demo App"), message: Text("Please enter your username"), dismissButton: .default(Text("OK")))
                }
    }
    
    private func validView() -> String? {
        if txtusername.isEmpty {
            return "Please enter your username"
        }
        
        return nil
    }
}
struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
    }
}
