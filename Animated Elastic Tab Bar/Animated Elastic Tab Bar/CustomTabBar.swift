//
//  CustomTabBar.swift
//  Animated Elastic Tab Bar
//
//  Created by A2006 on 2021/8/26.
//

import SwiftUI

struct CustomTabBar:View {
    
    var animation:Namespace.ID
    
    var size: CGSize
    var bottomEdge: CGFloat
    
    @Binding var currentTab:Tab
    
    @State var startAnimation: Bool = false
    
    var body: some View{
        HStack(spacing : 0){
            ForEach(Tab.allCases,id : \.rawValue){ tab in
                
                TabButton(tab: tab, animation: animation, currentTab: $currentTab) { pressedTab in
                    
                    withAnimation(.spring()){

                        startAnimation = true
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
                        withAnimation(.spring()){
                            currentTab = pressedTab
                            
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                        withAnimation(.spring()){
                            startAnimation = false
                            
                        }
                    }
                }
            }
        }
        
        .background(
        
            ZStack{
                
                
                let animationOffset: CGFloat = (startAnimation ? (startAnimation ? 15 : 19 ) : (bottomEdge == 0 ? 26 : 27))
                
                
                let offset :CGSize = bottomEdge == 0 ? CGSize(width: animationOffset, height: 31) : CGSize(width: animationOffset, height: 36)
                
                Rectangle()
                    .fill(Color .purple)
                    .frame(width: 45, height: 45)
                    .offset(y: 40)
                
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 45, height: 45)
                    .offset(x: offset.width, y: offset.height)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                Circle()
                    .fill(Color.white)
                    .frame(width: 45, height: 45)
                    .offset(x: -offset.width, y: offset.height)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
            }
            .offset(x: getStartOffset())
            .offset(x: getOffset())
            ,alignment: .leading
        
        )
        
        .padding(.horizontal,15)
        .padding(.top,7)
        .padding(.bottom,bottomEdge == 0 ? 20 : bottomEdge)
    }
    
    func getStartOffset()->CGFloat{
        let reduced = (size.width - 30) / 4
        let cecnter = (reduced - 45) / 2
        return cecnter
    }
    
    func getOffset()->CGFloat{
        let reduced = (size.width - 30 ) / 4
        let index = Tab.allCases.firstIndex{ checkTab in
            return checkTab == currentTab
        } ?? 0
        
        return reduced * CGFloat(index)
    }
    
}



struct TabButton:View {
    
    var tab :Tab
    var animation:Namespace.ID
    @Binding var currentTab :Tab
    
    var onTop:(Tab)->()
    
    var body: some View{
        Image(systemName: tab.rawValue)
            .foregroundColor(currentTab == tab ? .white : .gray)
            .frame(width: 45, height: 45)
            .background(
            
                ZStack{
                    
                    if currentTab == tab{
                        Circle()
                            .fill(Color .purple)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                    
                    
                    
                }
            
            )
        
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                onTop(tab)
            }
        
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
