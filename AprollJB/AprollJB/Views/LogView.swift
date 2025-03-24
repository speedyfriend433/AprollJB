import SwiftUI

struct LogView: View {
    let logs: [LogEntry]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(logs) { log in
                        Text("\(formatDate(log.timestamp)) \(log.message)")
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.green)
                            .id(log.id)
                    }
                }
                .padding()
            }
            .onChange(of: logs.count) { _ in
                if let lastLog = logs.last {
                    withAnimation {
                        proxy.scrollTo(lastLog.id, anchor: .bottom)
                    }
                }
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return "[\(formatter.string(from: date))]"
    }
}