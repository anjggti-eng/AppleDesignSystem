import SwiftUI

// MARK: - DSAvatar

public enum DSAvatarSize {
    case xs, sm, md, lg, xl

    var dimension: CGFloat {
        switch self {
        case .xs: return 24
        case .sm: return 32
        case .md: return 40
        case .lg: return 56
        case .xl: return 72
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .xs: return 10
        case .sm: return 12
        case .md: return 14
        case .lg: return 18
        case .xl: return 24
        }
    }
}

public struct DSAvatar: View {
    let name: String
    let imageUrl: String?
    let size: DSAvatarSize

    public init(
        name: String,
        imageUrl: String? = nil,
        size: DSAvatarSize = .md
    ) {
        self.name = name
        self.imageUrl = imageUrl
        self.size = size
    }

    public var body: some View {
        Group {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    initialsView
                }
            } else {
                initialsView
            }
        }
        .frame(width: size.dimension, height: size.dimension)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color(.systemBackground), lineWidth: 2)
        )
    }

    private var initialsView: some View {
        ZStack {
            Circle()
                .fill(avatarColor)

            Text(initials)
                .font(.system(size: size.fontSize, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
        }
    }

    private var initials: String {
        let words = name.split(separator: " ")
        if words.count >= 2 {
            return String(words[0].prefix(1) + words[1].prefix(1)).uppercased()
        }
        return String(name.prefix(2)).uppercased()
    }

    private var avatarColor: Color {
        let colors: [Color] = [
            DSColor.System.blue,
            DSColor.System.green,
            DSColor.System.purple,
            DSColor.System.orange,
            DSColor.System.pink,
            DSColor.System.indigo,
            DSColor.System.teal
        ]
        let index = abs(name.hashValue) % colors.count
        return colors[index]
    }
}

// MARK: - DSAvatar Group

public struct DSAvatarGroup: View {
    let names: [String]
    let size: DSAvatarSize
    let maxVisible: Int

    public init(
        names: [String],
        size: DSAvatarSize = .sm,
        maxVisible: Int = 3
    ) {
        self.names = names
        self.size = size
        self.maxVisible = maxVisible
    }

    public var body: some View {
        HStack(spacing: -size.dimension * 0.25) {
            ForEach(Array(visibleNames.enumerated()), id: \.offset) { _, name in
                DSAvatar(name: name, size: size)
            }

            if remainingCount > 0 {
                ZStack {
                    Circle()
                        .fill(DSColor.Fill.secondary)

                    Text("+\(remainingCount)")
                        .font(.system(size: size.fontSize * 0.9, weight: .semibold))
                        .foregroundStyle(DSColor.Label.secondary)
                }
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(.systemBackground), lineWidth: 2)
                )
            }
        }
    }

    private var visibleNames: [String] {
        Array(names.prefix(maxVisible))
    }

    private var remainingCount: Int {
        max(0, names.count - maxVisible)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        HStack {
            DSAvatar(name: "John Appleseed", size: .xs)
            DSAvatar(name: "Jane Smith", size: .sm)
            DSAvatar(name: "Bob Wilson", size: .md)
            DSAvatar(name: "Alice Brown", size: .lg)
            DSAvatar(name: "Charlie Davis", size: .xl)
        }

        DSAvatarGroup(
            names: ["John", "Jane", "Bob", "Alice", "Charlie"],
            size: .md,
            maxVisible: 3
        )
    }
    .padding()
}
