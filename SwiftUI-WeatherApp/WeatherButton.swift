//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Hafizur Rahman on 8/7/25.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
//
//#Preview {
//    WeatherButton(
//        title: "Change Day Time",
//        backgroundColor: .blue,
//        textColor: .white)
//}


struct ClassScheduleCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            // Left side - Times and dashes
            VStack(alignment: .leading, spacing: 14) {
                Text("11:30")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<7) { index in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: index % 2 == 0 ? 20 : 6, height: 1)
                    }
                }

                Text("01:00")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.leading, 12)
            .padding(.trailing, 6)
            .padding(.top)
            
            // 🔸 Vertical Divider
            Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 5, height: 145)
                    

            // Right side - Course details
            VStack(alignment: .leading, spacing: 12) {
                Text("IoT and Embedded Systems")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("lightBlue"))

                VStack(alignment: .leading, spacing: 6) {
                    rowItem(title: "Course", value: "CSE415")
                    rowItem(title: "Section", value: "61_N")
                    rowItem(title: "Teacher", value: "MFZ", valueColor: Color(.blue))
                    rowItem(title: "Room", value: "KT-303 (Computer Lab)")
                }
            }
            .padding(.vertical, 12)
            .padding(.trailing, 16)
            .padding(.leading, 12)

            Spacer(minLength: 0)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.85))
        )
        .padding(.horizontal, 16)
    }

    // Helper for rows
    func rowItem(title: String, value: String, valueColor: Color = .white.opacity(0.8)) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
            Spacer(minLength: 10)
            Text(value)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(valueColor)
        }
    }
}


#Preview {
    ClassScheduleCard()
}
