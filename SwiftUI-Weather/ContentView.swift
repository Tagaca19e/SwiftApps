//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Eidmone Tagaca on 10/15/23.
//

import SwiftUI

// View here
struct ContentView: View {
  // Views are created and destroyed but with @State, this is not created or
  // destroyed. They are stored somewhere else.
  @State private var isNight = false
  let dates: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri"]
  let temperatureIcons: [String] = [
    "cloud.drizzle.fill",
    "cloud.sun.fill",
    "cloud.fill",
    "wind",
    "snowflake"
  ]
  let temperatures: [Int] = [40, 80, 70, 55, 20]
  
  var body: some View {
    ZStack {
      // Linear background
      BackgroundView(isNight: $isNight) // $ for binding

      // City text
      VStack(spacing: 8) {
        CityTextView(cityName: "Cupertino, CA")

        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                              temperature: 70)

        // Columns of weather information.
        HStack(spacing: 20) {
          ForEach(dates.indices, id: \.self) { idx in
            // Display each weather day information.
            WeatherDayView(dayOfWeek: dates[idx],
                           imageName: temperatureIcons[idx],
                           temperature: temperatures[idx])
          }
        }

        Spacer()

        Button {
          isNight = !isNight
        } label: {
          WeatherButton(title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
        }

        // Spacers will fill all the space.
        Spacer()
      }
    }
  }
}

struct BackgroundView: View {
  // Binds the color that is already declared in the main
  // view so that they are always in sync.
  @Binding var isNight: Bool
  
  // Return body view.
  var body: some View {
    
//    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                   startPoint: .topLeading,
//                   endPoint: .bottomTrailing)
//    .ignoresSafeArea(.all)
    
    ContainerRelativeShape()
      .fill(isNight ? Color.black.gradient : Color.blue.gradient)
      .ignoresSafeArea()
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
        .symbolRenderingMode(.multicolor)
//        .symbolRenderingMode(.palette)  // New palette design, multiple colors
        .resizable()
//        .foregroundStyle(.white, .orange, .green)  // Colors for the icons
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      
      Text("\(temperature)°") // opt + shift + 8 = degree icon
        .font(.system(size: 25, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct CityTextView: View {
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct MainWeatherStatusView: View {
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit) // Make aspect ratio fit within frame.
        .frame(width: 180, height: 180)

      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
     .padding(.bottom, 40)
  }
}
