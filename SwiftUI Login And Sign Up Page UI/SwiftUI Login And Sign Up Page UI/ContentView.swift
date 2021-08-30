//
//  ContentView.swift
//  SwiftUI Login And Sign Up Page UI
//
//  Created by A2006 on 2021/8/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            if UIScreen.main.bounds.height < 750{
                ScrollView(.vertical ,showsIndicators : false){
                    Home()
                }
            }else{
                    Home()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct Home:View {
    
    @State var index = 0
    @Namespace var name
    var body: some View{
        VStack{
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 70, height: 70)
                
            HStack(spacing: 0){
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 0
                    }
                }){
                    VStack{
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
    
                        ZStack{
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 0{
                                Capsule()
                                    .fill(Color .red)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 1
                    }
                }){
                    VStack{
                        Text("Sign Up")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        
                        ZStack{
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 1{
                                Capsule()
                                    .fill(Color .red)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .padding(.top ,30)
            
            if index == 0{
                Login()
            }else{
                SignUp()
            }
            Spacer()
        }
    }
}





struct Login: View {
    
    
    @State var email = ""
    @State var password = ""
    
    
    @Namespace var animation
    var body: some View {
        
       
        
        
        
        VStack{
            
            HStack{
                Text("Login")
            }
            .padding()
            CustomTextField(image: "envelope", title: "EMAIL", value: $email , animtion: animation)
            CustomTextField(image: "lock", title: "PASSWORD", value: $password,animtion: animation)
                .padding(.top,5)
        }
    }
}



struct SignUp: View {
    var body: some View {
        
       Text("SignUp")
        
    }
}
