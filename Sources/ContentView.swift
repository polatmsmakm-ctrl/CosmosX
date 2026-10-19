
import SwiftUI

@main
struct CosmosXApp: App {
    var body: some Scene {
        WindowGroup {
            CosmosHome()
                .preferredColorScheme(.dark)
        }
    }
}

struct CosmosHome: View {
    @State private var tab = 0
    @State private var brightness = 0.7
    @State private var animate = true

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.01, green: 0.02, blue: 0.10),
                    .black,
                    Color(red: 0.08, green: 0.02, blue: 0.17)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()

            StarBackground(brightness: brightness, animate: animate)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "sparkles")
                        .font(.system(size: 27))
                        .foregroundStyle(.cyan)

                    VStack(alignment: .leading, spacing: 3) {
                        Text("COSMOS X")
                            .font(.system(size: 22, weight: .black))
                            .tracking(3)

                        Text("UNIVERSE EXPLORATION SYSTEM")
                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                            .foregroundStyle(.cyan)
                    }

                    Spacer()

                    Circle()
                        .fill(.green)
                        .frame(width: 7, height: 7)

                    Text("ONLINE")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                }
                .padding(20)

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        if tab == 0 {
                            ZStack(alignment: .bottomLeading) {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(
                                        LinearGradient(
                                            colors: [.blue.opacity(0.3), .purple.opacity(0.25), .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottomLeading
                                        )
                                    )

                                GalaxyArtwork()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))

                                VStack(alignment: .leading, spacing: 9) {
                                    Text("EXPLORE THE\nINFINITE")
                                        .font(.system(size: 31, weight: .black))
                                        .tracking(1)

                                    Text("Your journey beyond the stars begins here.")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.white.opacity(0.7))

                                    Label("DEEP SPACE SYSTEM ACTIVE", systemImage: "scope")
                                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                                        .foregroundStyle(.cyan)
                                }
                                .padding(20)
                            }
                            .frame(height: 280)
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.cyan.opacity(0.35), lineWidth: 1)
                            }

                            HStack(spacing: 10) {
                                stat("GALAXIES", "2T+", "sparkles")
                                stat("STARS", "∞", "star.fill")
                                stat("MISSION", "ACTIVE", "scope")
                            }

                            Text("COSMIC DESTINATIONS")
                                .font(.system(size: 12, weight: .black, design: .monospaced))
                                .tracking(1.5)

                            destination("Milky Way", "OUR HOME GALAXY", "circle.hexagongrid.fill", .cyan)
                            destination("Andromeda", "NEAREST MAJOR GALAXY", "sparkles", .purple)
                            destination("Saturn", "RINGED PLANET", "circle.inset.filled", .orange)
                            destination("Orion Nebula", "STELLAR NURSERY", "cloud.fill", .pink)

                        } else if tab == 1 {
                            Text("STELLAR SCANNER")
                                .font(.system(size: 21, weight: .black))

                            Text("VISUAL OBSERVATION MODE")
                                .font(.system(size: 10, design: .monospaced))
                                .foregroundStyle(.cyan)

                            ZStack {
                                ForEach(0..<4) { i in
                                    Circle()
                                        .stroke(.cyan.opacity(0.2), lineWidth: 1)
                                        .frame(width: CGFloat(85 + i * 65),
                                               height: CGFloat(85 + i * 65))
                                }

                                Image(systemName: "scope")
                                    .font(.system(size: 55))
                                    .foregroundStyle(.cyan)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 340)

                            Text("Scanner simulation only. No telescope or live detection is connected.")
                                .font(.system(size: 12))
                                .foregroundStyle(.white.opacity(0.6))

                        } else {
                            Text("SYSTEM CONFIGURATION")
                                .font(.system(size: 20, weight: .black))

                            VStack(alignment: .leading, spacing: 20) {
                                Text("STARFIELD INTENSITY")
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))

                                Slider(value: $brightness, in: 0.1...1)
                                    .tint(.cyan)

                                Toggle("Ambient star animation", isOn: $animate)
                                    .tint(.cyan)

                                Divider().overlay(.white.opacity(0.15))

                                Label("ALL SYSTEMS NOMINAL", systemImage: "checkmark.shield.fill")
                                    .foregroundStyle(.green)
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                            }
                            .padding(20)
                            .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.bottom, 20)
                }

                HStack {
                    tabButton("square.grid.2x2.fill", "BRIDGE", 0)
                    tabButton("scope", "SCANNER", 1)
                    tabButton("slider.horizontal.3", "SYSTEM", 2)
                }
                .padding(.top, 14)
                .padding(.bottom, 8)
                .background(.black.opacity(0.85))
            }
        }
    }

    func stat(_ title: String, _ value: String, _ icon: String) -> some View {
        VStack(alignment: .leading, spacing: 9) {
            Image(systemName: icon).foregroundStyle(.cyan)
            Text(value).font(.system(size: 15, weight: .black, design: .monospaced))
            Text(title).font(.system(size: 8, weight: .bold, design: .monospaced))
                .foregroundStyle(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 15))
    }

    func destination(_ name: String, _ detail: String, _ icon: String, _ color: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(color)
                .frame(width: 52, height: 52)
                .background(color.opacity(0.12), in: RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 5) {
                Text(name).font(.system(size: 15, weight: .bold))
                Text(detail)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundStyle(color)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(.white.opacity(0.4))
        }
        .padding(12)
        .background(.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.white.opacity(0.08), lineWidth: 1)
        }
    }

    func tabButton(_ icon: String, _ title: String, _ index: Int) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                tab = index
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: icon).font(.system(size: 18))
                Text(title)
                    .font(.system(size: 8, weight: .bold, design: .monospaced))
            }
            .foregroundStyle(tab == index ? Color.cyan : Color.white.opacity(0.45))
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

struct StarBackground: View {
    let brightness: Double
    let animate: Bool

    var body: some View {
        TimelineView(.animation(minimumInterval: 0.08, paused: !animate)) { timeline in
            Canvas { context, size in
                let time = timeline.date.timeIntervalSinceReferenceDate

                for i in 0..<180 {
                    let x = CGFloat((i * 73 + 19) % 997) / 997 * size.width
                    var y = CGFloat((i * 137 + 31) % 991) / 991 * size.height

                    if animate {
                        y = (y + CGFloat(time.truncatingRemainder(dividingBy: 80))
                             * CGFloat(i % 3 + 1) * 0.2)
                            .truncatingRemainder(dividingBy: max(size.height, 1))
                    }

                    let radius = CGFloat(i % 3 + 1) * 0.55
                    let rect = CGRect(x: x, y: y, width: radius, height: radius)

                    context.opacity = brightness * (i % 5 == 0 ? 1 : 0.45)
                    context.fill(
                        Path(ellipseIn: rect),
                        with: .color(i % 9 == 0 ? .cyan : .white)
                    )
                }
            }
        }
        .allowsHitTesting(false)
    }
}

struct GalaxyArtwork: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0..<5) { i in
                    Ellipse()
                        .stroke(
                            i.isMultiple(of: 2) ? .cyan.opacity(0.35) : .purple.opacity(0.4),
                            lineWidth: 1
                        )
                        .frame(
                            width: geo.size.width * (0.35 + CGFloat(i) * 0.12),
                            height: geo.size.height * (0.12 + CGFloat(i) * 0.035)
                        )
                        .rotationEffect(.degrees(Double(i * 23)))
                }

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.white, .cyan, .purple.opacity(0.6), .clear],
                            center: .center,
                            startRadius: 1,
                            endRadius: 95
                        )
                    )
                    .frame(width: 190, height: 190)
            }
            .position(x: geo.size.width * 0.73, y: geo.size.height * 0.36)
        }
        .allowsHitTesting(false)
    }
}
