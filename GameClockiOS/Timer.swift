//
//  Timer.swift
//  GameClockiOS
//
//  Created by Christian Rodriguez on 2/16/23.
//

import SwiftUI
import UserNotifications


struct Timer: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    var body: some View {
        ZStack{
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                ZStack{
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    VStack{
                        
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        
                        Text("Of 15")
                            .font(.title)
                            .padding(.top)
                    }
                }
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        
                        if self.count == 15{
                            
                            self.count = 0
                            withAnimation(.default){
                                
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 6)
                    }
                    
                    Button(action: {
                        
                        self.count = 0
                        
                        withAnimation(.default){
                            
                            self.to = 0
                        }
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.red)
                            
                            Text("Restart")
                                .foregroundColor(.red)
                            
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            
                            Capsule()
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .shadow(radius: 6)
                    }
                }
                .padding(.top, 55)
            }
            
        }
//        .onAppear(perform: {
//
//            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
//            }
//        })
//        .onReceive(self.time) { (_) in
//
//            if self.start{
//
//                if self.count != 15{
//
//                    self.count += 1
//                    print("hello")
//
//                    withAnimation(.default){
//
//                        self.to = CGFloat(self.count) / 15
//                    }
//                }
//                else{
//
//                    self.start.toggle()
//                    self.Notify()
//                }
//
//            }
//        }
    }
    
}


struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        Timer()
    }
}
