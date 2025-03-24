//
//  ContentView.swift
//  AprollJB
//
//  Created by 이지안 on 3/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isJailbreaking = false
    @State private var logs: [LogEntry] = []
    @State private var progress: CGFloat = 0
    @State private var selectedTab = 0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // In the ContentView struct, modify the body property
    
    var body: some View {
        ZStack {
            if isJailbreaking && progress >= 1.0 {
                FileManagerView()
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .move(edge: .trailing)),
                        removal: .opacity.combined(with: .move(edge: .leading))
                    ))
            } else {
                mainJailbreakView
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .move(edge: .leading)),
                        removal: .opacity.combined(with: .move(edge: .trailing))
                    ))
            }
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isJailbreaking && progress >= 1.0)
    }
    
    private var mainJailbreakView: some View {
        ZStack {
            // Animated background layers
            ZStack {
                // Base gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "0A0A12"),
                        Color(hex: "1A1A2E"),
                        Color(hex: "1E1E36")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                // Cyber grid pattern
                VStack(spacing: 15) {
                    ForEach(0..<20) { _ in
                        HStack(spacing: 15) {
                            ForEach(0..<10) { _ in
                                Circle()
                                    .fill(Color.white.opacity(0.03))
                                    .frame(width: 4, height: 4)
                            }
                        }
                    }
                }
                .rotationEffect(.degrees(45))
                .scaleEffect(1.5)
                
                // Glowing orbs
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "FF2D55").opacity(0.2),
                                Color(hex: "FF2D55").opacity(0.0)
                            ]),
                            center: .center,
                            startRadius: 1,
                            endRadius: 150
                        )
                    )
                    .frame(width: 300, height: 300)
                    .offset(x: -100, y: -200)
                    .blur(radius: 30)
                
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "FF9500").opacity(0.15),
                                Color(hex: "FF9500").opacity(0.0)
                            ]),
                            center: .center,
                            startRadius: 1,
                            endRadius: 120
                        )
                    )
                    .frame(width: 240, height: 240)
                    .offset(x: 120, y: 200)
                    .blur(radius: 25)
                
                // Scanline effect
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.0),
                                Color.white.opacity(0.01),
                                Color.white.opacity(0.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: UIScreen.main.bounds.height)
            }
            .ignoresSafeArea()
            
            // Content overlay with slight blur
            Rectangle()
                .fill(Color(hex: "121212").opacity(0.3))
                .background(.ultraThinMaterial)
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // Header with glow effect
                Text("AprollJB")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "FF2D55"), Color(hex: "FF9500")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: Color(hex: "FF2D55").opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding(.top, 50)
                
                // Device info
                Text("iPhone • iOS 18.2")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.6))
                    .padding(.top, -15)
                
                Spacer()
                
                // Log View with improved styling
                if isJailbreaking {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Console")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.8))
                            Spacer()
                            Image(systemName: "terminal.fill")
                                .foregroundColor(Color(hex: "FF2D55"))
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 15)
                        
                        LogView(logs: logs)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(hex: "0A0A0F"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .strokeBorder(Color.white.opacity(0.1), lineWidth: 1)
                                    )
                            )
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "1A1A25"))
                            .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 5)
                    )
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                
                    // Progress Bar with improved styling
                    VStack(spacing: 5) {
                        ProgressView(value: progress, total: 1.0)
                            .tint(Color(hex: "FF2D55"))
                            .background(Color(hex: "0A0A0F").clipShape(Capsule()))
                            .scaleEffect(x: 1, y: 1.5, anchor: .center)
                            .padding(.horizontal)
                        
                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    .padding(.top, 10)
                    .transition(.opacity)
                }
                
                Spacer()
                
                // Jailbreak Button with improved styling
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        isJailbreaking = true
                        startJailbreak()
                    }
                }) {
                    Text(isJailbreaking ? "JAILBREAKING..." : "JB NOW")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            isJailbreaking ? 
                                LinearGradient(
                                    colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.3)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ) :
                                LinearGradient(
                                    colors: [Color(hex: "FF2D55"), Color(hex: "FF375F")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.1), lineWidth: 1)
                        )
                        .shadow(color: isJailbreaking ? Color.black.opacity(0.1) : Color(hex: "FF2D55").opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding(.horizontal)
                }
                .disabled(isJailbreaking)
                .padding(.bottom, 50)
            }
        }
        .onReceive(timer) { _ in
            if isJailbreaking {
                updateProgress()
            }
        }
    }
    
    private func startJailbreak() {
        logs.removeAll()
        progress = 0
        addLog("Starting AprollJB v1.0...")
        
        let jailbreakSteps = [
            (1.0, "Detecting iOS version..."),
            (1.5, "iOS 18.2 detected"),
            (2.0, "Exploiting kernel..."),
            (2.5, "Bypassing PAC/PPL..."),
            (3.0, "Patching kernel..."),
            (3.5, "Setting up root filesystem..."),
            (4.0, "Mounting system partition..."),
            (4.5, "Installing Sileo..."),
            (5.0, "Setting up bootstrap..."),
            (5.5, "APRIL FOOLS! 🎉"),
            (5.6, "This is not a real jailbreak!")
        ]
        
        for (delay, message) in jailbreakSteps {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                addLog(message)
            }
        }
        
        // Reset after prank
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            withAnimation {
                selectedTab = 1 // Switch to file manager
            }
        }
    }
    
    private func updateProgress() {
        if progress < 1.0 {
            progress = min(progress + 0.01, 1.0)  // Clamp progress to 1.0
        }
    }
    
    private func addLog(_ message: String) {
        withAnimation {
            logs.append(LogEntry(message: message))
        }
    }
}
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return "[\(formatter.string(from: date))]"
    }


#Preview {
    ContentView()
}
