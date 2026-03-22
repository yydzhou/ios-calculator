import SwiftUI

enum CalculatorButton: String, Hashable {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case decimal = ".", equals = "="
    case add = "+", subtract = "−", multiply = "×", divide = "÷"
    case clear = "AC", negative = "+/−", percent = "%"

    var backgroundColor: Color {
        switch self {
        case .clear, .negative, .percent: return Color(.lightGray)
        case .add, .subtract, .multiply, .divide, .equals: return .orange
        default: return Color(white: 0.2)
        }
    }

    var foregroundColor: Color {
        switch self {
        case .clear, .negative, .percent: return .black
        default: return .white
        }
    }

    var isWide: Bool { self == .zero }
}

struct CalculatorButtonView: View {
    let button: CalculatorButton
    let action: () -> Void

    private let size: CGFloat = (UIScreen.main.bounds.width - 5 * 12) / 4

    var body: some View {
        Button(action: action) {
            Text(button.rawValue)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(button.foregroundColor)
                .frame(
                    width: button.isWide ? size * 2 + 12 : size,
                    height: size
                )
                .background(button.backgroundColor)
                .clipShape(Capsule())
        }
    }
}
