//
//  ContentView.swift
//  ControlCenter
//
//  Created by João Gabriel Pozzobon dos Santos on 09/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(colors: [.mint, .indigo], startPoint: .bottom, endPoint: .top)
            
            Canvas { context, size in
                let spacing = 12.0
                
                for i in 0...Int(size.width/spacing) {
                    for j in 0...Int(size.height/spacing) {
                        let frame = CGRect(x: spacing*Double(i), y: spacing*Double(j), width: 3, height: 3)
                        context.opacity = spacing*Double(j)/size.height
                        context.fill(Ellipse().path(in: frame), with: .color(.white))
                    }
                }
                
                let gridCols = 4
                let gridRows = 6
                
                let colors: [Color] = [.mint, .orange, .purple, .green, .red, .white, .yellow, .mint, .orange, .purple, .green, .teal, .red, .white, .brown, .yellow, .mint, .orange, .purple, .green, .teal, .red, .white, .yellow]
                
                for i in 0..<gridCols {
                    for j in 0..<gridRows {
                        let frame = CGRect(x: 20+102*Double(i), y: 80+100*Double(j), width: 80, height: 80)
                        
                        let color = colors[j*gridCols+i]
                        context.fill(RoundedRectangle(cornerRadius: 17.5, style: .continuous).path(in: frame), with: .color(color))
                    }
                }
            }
            
            VStack {
                Image(systemName: "chevron.compact.down")
                    .foregroundColor(.secondary)
                    .font(.system(size: 50, weight: .bold))
                    .padding(10)
                
                HStack(spacing: 20) {
                    Toggle(systemName: "airplane", active: false)
                    Toggle(systemName: "wifi", active: true)
                    Toggle(systemName: "battery.25", active: true)
                    Toggle(systemName: "moon.fill", active: false)
                    Toggle(systemName: "lock", active: true)
                }.padding(.horizontal, 20)
                    .frame(height: 90)
                
                ControlDivider()
                
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: .constant(0.6))
                        .padding()
                    Image(systemName: "sun.max")
                }.padding(.horizontal, 30)
                    .font(.title3.bold())
                .foregroundStyle(.secondary)
                
                ControlDivider()
                
                VStack {
                    HStack {
                        Text("0:51")
                        ZStack {
                            Rectangle().fill(.primary).frame(height: 6)
                            Rectangle()
                                .fill(.white)
                                .frame(width: 2, height: 14)
                                .offset(x: -30)
                        }
                        Text("2:00")
                    }.font(.caption)
                    .padding(.horizontal)
                    .foregroundStyle(.secondary)
                    
                    Text("Hello Hello Hello")
                        .font(.title2.bold())
                        .foregroundStyle(.primary)
                        .foregroundColor(.white)
                    
                    Text("Remi Wolf")
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 50) {
                        Image(systemName: "backward.fill")
                        Image(systemName: "play.fill")
                        Image(systemName: "forward.fill")
                    }.padding(5)
                        .font(.title)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Image(systemName: "speaker.fill")
                        Slider(value: .constant(0.6))
                            .padding()
                        Image(systemName: "speaker.wave.3.fill")
                    }.padding(.horizontal, 20)
                        .font(.title3.bold())
                    .foregroundStyle(.secondary)
                }.padding()
                
                ControlDivider()
                
                HStack {
                    Spacer()
                    Label("WireDrop", systemImage: "cable.connector")
                        .font(.title3.bold())
                        .foregroundStyle(.secondary)
                        .foregroundColor(.black)
                    
                    Spacer()
                    Rectangle()
                        .fill(.primary)
                        .frame(width: 2, height: 60)
                    Spacer()
                    
                    Label("AirPlay", systemImage: "airplayvideo")
                        .font(.title3.bold())
                        .foregroundStyle(.secondary)
                        .foregroundColor(.black)
                    Spacer()
                }.frame(height: 40)
                
                ControlDivider()
                
                HStack(spacing: 20) {
                    ControlApps(systemName: "flashlight.on.fill", active: true)
                    ControlApps(systemName: "timer", active: false)
                    ControlApps(systemName: "appletvremote.gen4.fill", active: false)
                    ControlApps(systemName: "camera.fill", active: false)
                }.padding(.horizontal, 25)
                    .padding(.bottom, 35)
                    .padding(.vertical, 10)
            }.background(.ultraThinMaterial)
                .frame(height: 680)
        }.ignoresSafeArea()
            .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Toggle: View {
    let systemName: String
    let active: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.secondary, lineWidth: 2)
            
            Image(systemName: systemName)
                .font(.title2.bold())
                .foregroundStyle(.secondary)
        }.foregroundColor(active ? .white : .black)
    }
}

struct ControlDivider: View {
    var body: some View {
        Rectangle()
            .fill(.primary)
            .frame(height: 2)
    }
}

struct ControlApps: View {
    let systemName: String
    let active: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14.5, style: .continuous)
                .stroke(.secondary, lineWidth: 2)
                .aspectRatio(1.0, contentMode: .fit)
            
            Image(systemName: systemName)
                .font(.title.bold())
                .foregroundStyle(.secondary)
        }.foregroundColor(active ? .white : .black)
    }
}
