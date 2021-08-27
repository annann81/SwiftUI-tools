//
//  Home.swift
//  Animated Elastic Tab Bar
//
//  Created by A2006 on 2021/8/26.
//

import SwiftUI

struct Home: View {
   
        @State var currentTab : Tab = .Home
        
        
        init(size:CGSize,bottomEdge:CGFloat ){
            self.size = size
            self.bottomEdge = bottomEdge
            UITabBar.appearance().isHidden = true
        }
        @Namespace var animation
    
        var size: CGSize
        var bottomEdge: CGFloat
    
    
        var body: some View {
            ZStack(alignment: .bottom) {
                TabView(selection: $currentTab){
                    Text("Home")
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.black.opacity(0.04).ignoresSafeArea())
                        .tag(Tab.Home)
                    Text("Settings")
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.black.opacity(0.04).ignoresSafeArea())
                        .tag(Tab.Settings)
                    Text("Liked")
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.black.opacity(0.04).ignoresSafeArea())
                        .tag(Tab.Liked)
                    Text("Search")
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.black.opacity(0.04).ignoresSafeArea())
                        .tag(Tab.Search)
                }
                CustomTabBar(animation: animation,size:size,bottomEdge:bottomEdge,currentTab: $currentTab)
                    .background(Color.white)
            }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



enum Tab:String ,CaseIterable{
    case Home = "house.fill"
    case Settings = "gearshape"
    case Liked = "suit.heart.fill"
    case Search = "magnifyingglass"
}
