//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct ChangePasswordView: View {
    
    @EnvironmentObject var authModel: AuthenticationModel
    @Environment(\.dismiss) var dismiss
    
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var newConfirmed = ""

    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
    
    private func changePassword(newPassword: String) {
        Task {
            if await authModel.changePassword(newPassword: newPassword) == true {
                dismiss()
            }
        }
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.44, y: geomtry.size.height*0.54)
                    .clipped()
                    .ignoresSafeArea()
                
                //image title
                Text("Change Password")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.34)
                    .font(Font.custom("LondonTwo", size: 48))
                    .foregroundColor(.white)
                
                //textfield - username
                TextField("Enter current password", text: $currentPassword)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.45)
                    
                
                //textfield - password
                TextField("Enter new password", text: $newPassword)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.525)
                
                TextField("Confirm new password", text: $newConfirmed)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.6)
                
                //log in
                Button("Change Password") {
                    changePassword(newPassword: newPassword)
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.675)
                
            }
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
