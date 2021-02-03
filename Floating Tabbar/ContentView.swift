//
//  ContentView.swift
//  Floating Tabbar
//
//  Created by 亚飞 on 2021/2/3.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected : Int = 0
    
    var  dataArr = ["Home", "magnifyingglass", "person"]
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            GeometryReader{ _ in
                
                Text(dataArr[selected])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: $selected)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            HStack {
                
                if !self.expand {
                    
                    Button(action: {self.expand.toggle()}, label: {
                        
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    })
                }
                else {
                   
                    Button(action: { selected = 0}, label: {
                        
                        Image(systemName: "house")
                            .foregroundColor(selected == 0 ? Color.black : Color.gray)
                            .padding(.horizontal)
                    })
                    
                    Spacer(minLength: 15)
                    
                    Button(action: { selected = 1}, label: {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(selected == 1 ? Color.black : Color.gray)
                            .padding(.horizontal)
                    })
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        selected = 2
                        
                    }, label: {
                        
                        Image(systemName: "person")
                            .foregroundColor(selected == 2 ? Color.black : Color.gray)
                            .padding(.horizontal)
                    })
                }
            }
            .padding(.horizontal, self.expand ?  35 : 10)
            .padding(.vertical, self.expand ?  20 : 20)
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .onLongPressGesture {
                
                self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
