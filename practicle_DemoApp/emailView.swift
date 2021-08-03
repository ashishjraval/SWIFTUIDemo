//
//  UsernameView.swift
//  practicle_DemoApp
//
//  Created by Ashish Raval on 03/08/21.
//
import SwiftUI
import UIKit

struct emailView: View {
    @State private var textEmail: String = ""
    @State private var showingAlert = false
    @State private var isValid = false
    @State private var isValidMsg = false
    @State private var strJSON: String = ""
    @State private var strUserName: String = ""

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
                    Text("What's your email address?")
                        .font(.title)
                    VStack {
                        TextField("Enter your email", text: $textEmail, onEditingChanged: { (isChanged) in
                            
                        })
                        .font(.headline)
                        .padding(10)
                        .background(Color.white)
                        .frame(width: 300, height: 40, alignment: .center)
                        .cornerRadius(20)
                        .autocapitalization(.none)
                        
                        Divider()
                            .padding(.horizontal, 30)
                        
                    }
                    .background(Color(.white))
                    
                    Button("Continue") {
                         
                        if self.isValidEmail(self.textEmail) {
                            self.strUserName = UserDefaults.standard.object(forKey: "username") as? String ?? ""
                            let strJSON = createuserModel(strusername: self.strUserName, stremailid: self.textEmail)
                            
                            let encoder = JSONEncoder()
                            encoder.outputFormatting = .prettyPrinted
                            do {
                                    let result = try encoder.encode(strJSON)
                                    if let jsonString = String(data: result, encoding: .utf8){                            
                                        print("JSON \(jsonString)")
                                        isValid = true

                                    }
                                } catch {
                                    print("Your parsing sucks \(error)")
                                }
                            
                            
                            
                        } else {
                            self.textEmail = ""
                            self.showingAlert = true
                            return
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                    .font(.title)
                    .background(
                        NavigationLink(destination: shareView(), isActive: $isValid) {  }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Demo App"), message: Text("Entered Email is invalid"), dismissButton: .default(Text("OK")))
        }
    }
    

    
    private func validView() -> String? {
            if textEmail.isEmpty {
                return "Email is empty"
            }
            
            if !self.isValidEmail(textEmail) {
                return "Email is invalid"
            }
            
            
            return nil
        }
    
    private func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
}


