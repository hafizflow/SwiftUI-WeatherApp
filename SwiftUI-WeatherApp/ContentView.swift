//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Hafizur Rahman on 8/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityNameView(cityName: "Mirpur, Dhaka").padding(.top, 20)
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 53)
            
                HStack(spacing: 20){
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 18
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "snow",
                        temperature: 10
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 30
                    )
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12){
            Text(dayOfWeek)
                .font(.system(size: 22  , weight: .semibold))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            Text("\(temperature)°")
                .font(.system(size: 28  , weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [ isNight ? .black : .blue,isNight ? .gray: Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(.white)
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}


