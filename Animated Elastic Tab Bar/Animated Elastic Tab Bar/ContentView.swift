//
//  ContentView.swift
//  Animated Elastic Tab Bar
//
//  Created by A2006 on 2021/8/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
     
        GeometryReader{proxy in
            
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            Home(size:size,bottomEdge:bottomEdge)
                .ignoresSafeArea(.all , edges:.bottom)
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






