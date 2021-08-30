//
//  CustomTextField.swift
//  SwiftUI Login And Sign Up Page UI
//
//  Created by A2006 on 2021/8/27.
//

import SwiftUI



struct CustomTextField: View {
    
    var image : String
    var title : String
    @Binding var value: String
    var animtion :Namespace.ID
    
    var body: some View {
        VStack(spacing :6){
            HStack(alignment: .bottom) {
                Image(systemName: image)
                    .font(.system(size: 22))
                    .foregroundColor(.primary)
                    .frame(width:35)
                
                VStack(alignment: .leading, spacing: 6){
                    if value != ""{
                        Text(title)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(.gray)
                            .matchedGeometryEffect(id: title, in: animtion)
                    }
                    
                    
                    
                    
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                        
                        
                        if value == ""{
                            Text(title)
                                .font(.caption)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                                .matchedGeometryEffect(id: title, in: animtion)
                        }
                        
                       
                        
                        TextField("",text: $value)
                        
                    }
                }
                
                
            }
            if value == ""{
            Divider()
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color.white.opacity(value != "" ? 1 : 0))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.top)
        .animation(.linear)
    }
    
}
