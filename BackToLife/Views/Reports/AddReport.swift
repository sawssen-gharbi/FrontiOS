//
//  add_mood.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 5/4/2023.
//

import SwiftUI
import SwiftUIX
struct AddReport: View {

    var body: some View {
        ZStack{
            Image("color-bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false){
                VStack{
                    Spacer().frame(height: 30)
                    
                    MoodCard(title:"Today's depressed mood:" )
                    MoodCard(title:"Today's elevated mood:" )
                    MoodCard(title:"Today's irritability mood:" )
                    
                    Spacer().frame(height: 30)
                    
                    Button(action: {
                
                    }) {
                        Text("Done")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor( .white)
                            .frame(height: 44)
                            .padding(.horizontal, 88)
                            .background(Color("DarkPink"))
                            .cornerRadius(50)
                    }
                    
                }
            }
          
            
        }
    }
}

struct add_report_Previews: PreviewProvider {
    static var previews: some View {
        AddReport()
    }
}

struct MoodCard: View{

    @State var sliderValue : Float = 0.0
    
        var title: String = "How's your depressed mood today?"
    
    var body: some View {
        VisualEffectBlurView(blurStyle: .light, content: {
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color("DarkPink").opacity(0.7))
                    
                VStack {
                       Text("Current Slider Value: \(Int(sliderValue))")
                       Slider(value: $sliderValue, in: 0...10) {
                           Text("Slider")
                       } minimumValueLabel: {
                           Image(systemName: "hand.thumbsdown")

                       } maximumValueLabel: {
                           Image(systemName: "hand.thumbsup")

                       }.tint(Color("DarkPink"))
                    
                           .padding()
                    
                   }
                
               }
            
            
            .padding()
            
        })
        .frame(width: 320, height: 200)
        .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
        .background(
            RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.white).opacity(0.8)
        )
        
    
        
       
        }
    
    }

