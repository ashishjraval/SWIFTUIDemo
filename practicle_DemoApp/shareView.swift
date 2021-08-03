//
//  UsernameView.swift
//  practicle_DemoApp
//
//  Created by Ashish Raval on 03/08/21.
//
import SwiftUI

struct shareView: View {

    let verticalPaddingForForm = 40
    @State private var showShareSheet = false

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
                Text("thank you for join us!")
                    .font(.title)
                
                .background(Color(.white))
                
                
                Button("Share with friends!") {
                     
//                    // some validate code here like
//                    if ((self.validView()) != nil){
//                        self.showingAlert = true
//                        isValid = false
//                    }
//                    else{
//                        isValid = true
//                        UserDefaults.standard.set(self.txtusername, forKey: "username")
//                    }
                    self.showShareSheet = true

                }
                .frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .font(.title)
                .background(
                    NavigationLink(destination: emailView()) {  }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .sheet(isPresented: $showShareSheet) {
                    ShareSheet(activityItems: ["Hello This is Demo app in SWIFTUI"])
                }
        
    }
        
    }
    
    struct ShareSheet: UIViewControllerRepresentable {
        typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
        
        let activityItems: [Any]
        let applicationActivities: [UIActivity]? = nil
        let excludedActivityTypes: [UIActivity.ActivityType]? = nil
        let callback: Callback? = nil
        
        func makeUIViewController(context: Context) -> UIActivityViewController {
            let controller = UIActivityViewController(
                activityItems: activityItems,
                applicationActivities: applicationActivities)
            controller.excludedActivityTypes = excludedActivityTypes
            controller.completionWithItemsHandler = callback
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
            // nothing to do here
        }
    }
}
struct shareView_Previews: PreviewProvider {
    static var previews: some View {
        shareView()
    }
}
