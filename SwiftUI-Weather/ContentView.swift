//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Eidmone Tagaca on 10/15/23.
//

import SwiftUI

// View here
struct ContentView: View {
  var body: some View {
    ZStack {
      BackgroundView(topColor: .blue,
                     bottomColor: Color("lightBlue"))

      VStack(spacing: 8) {
        // Text is a view, takes in a string.
        Text("Cupertino, CA")
          .font(.system(size: 32, weight: .medium, design: .default))
          .foregroundColor(.white)
          .padding()

        VStack(spacing: 8) {
          Image(systemName: "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit) // Make aspect ratio fit within frame.
            .frame(width: 180, height: 180)

          Text("76")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        }
         .padding(.bottom, 40)


        // Columns of weather information.
        HStack(spacing: 20) {
          WeatherDayView(dayOfWeek: "MON",
                         imageName: "cloud.drizzle.fill",
                         temperature: 40)
          WeatherDayView(dayOfWeek: "TUE",
                         imageName: "cloud.sun.fill",
                         temperature: 80)
          WeatherDayView(dayOfWeek: "WED",
                         imageName: "cloud.fill",
                         temperature: 70)
          WeatherDayView(dayOfWeek: "THU",
                         imageName: "wind",
                         temperature: 55)
          WeatherDayView(dayOfWeek: "FRI",
                         imageName: "snowflake",
                         temperature: 20)
        }

        Spacer()

        Button {
          print("tapped")
        } label: {
          Text("Change Day Time")
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        }

        // Spacers will fill all the space.
        Spacer()
      }
    }
  }
}

struct BackgroundView: View {
  var topColor: Color
  var bottomColor: Color
  
  // Return body view.
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}

// View reusability for day weather card.
struct WeatherDayView: View {
  // Parameters.
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 18, weight: .medium))
        .foregroundColor(.white)

      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      
      Text("\(temperature)°") // cmd + shift + 8 = degree icon
        .font(.system(size: 25, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Previews_ContentView_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
