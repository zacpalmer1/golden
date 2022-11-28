//
//  ContentView.swift
//  Timer
//
//  Created by Grayson Hackett on 10/26/22.
//

import SwiftUI

struct TimerBack: View {
    @State var secondsCount = 59
    @State var timerRunning = true
    @State var timeZoneMinutes = minutesToSunset()
    @State var timeZoneHours = timeToSunset()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    
    
    var body: some View {
        VStack{
        
            Text("\(timeZoneHours):\(timeZoneMinutes):\(secondsCount)")
                .frame(maxHeight: .infinity, alignment: .bottom)
                .font(Font.custom("FredokaOne-Regular", size: 46))
                .foregroundColor(.black)
                .onReceive(timer) { _ in
                    if timerRunning {
                        
                        secondsCount -= 1
                        
                        if timeZoneHours == 0 && timeZoneMinutes == 0 && secondsCount == 0 {
                            timerRunning = false    // timer is up
                        }
                        
                        else if secondsCount == 0 {
                            timeZoneMinutes -= 1
                            secondsCount = 59
                        }
                        else if timeZoneMinutes == 0 && secondsCount == 0 {
                            timeZoneHours -= 1
                            timeZoneMinutes = 59
                        }
                        
                    } else {
                        
                        timerRunning = false
                    }
                
                    
                }
                .font(.system(size: 80, weight: .bold))
                .opacity(0.80)
            
//            HStack(spacing: 30){
//                Button("Start"){
//                    timerRunning = true
//                }
//                Button("Reset"){
//                    secondsCount = 10
//                }
//                .foregroundColor(.black)
//                Button("Stop"){
//                    timerRunning = false
//                }.foregroundColor(.red)
//            }
        }
    }
    
//    func getCurrentTime()-> String{
//        let today = Date()
//        let timeZone = Int(TimeZone.current.secondsFromGMT(for: today) / 3600)
//        let theDate = "\(timeZone)"
//        return theDate
//    }
//
}

func timeToSunset()-> Int{
    
    let today = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from:today)
    
    if hour > 17{
        return 24 - hour + 17 - 1
    }
    else{
        return 17 - hour - 1
    }
}

func minutesToSunset()-> Int{
    
    let today = Date()
    let calendar = Calendar.current
    let minute = calendar.component(.minute, from: today)
    
    if minute < 14{
        return 14 - minute
    }
    else if minute == 14 {
        return 0
    }
    else {
        return 60 - minute + 14
    }
    
}

struct TimerBack_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
