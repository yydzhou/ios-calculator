import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var displayValue: String = "0"

    private var currentValue: Double = 0
    private var storedValue: Double = 0
    private var pendingOperation: CalculatorButton?
    private var shouldResetDisplay = false

    func tap(_ button: CalculatorButton) {
        switch button {
        case .clear:
            reset()
        case .negative:
            toggleSign()
        case .percent:
            applyPercent()
        case .add, .subtract, .multiply, .divide:
            setOperation(button)
        case .equals:
            calculate()
        case .decimal:
            appendDecimal()
        default:
            appendDigit(button.rawValue)
        }
    }

    private func reset() {
        displayValue = "0"
        currentValue = 0
        storedValue = 0
        pendingOperation = nil
        shouldResetDisplay = false
    }

    private func toggleSign() {
        currentValue = -currentValue
        displayValue = formatted(currentValue)
    }

    private func applyPercent() {
        currentValue /= 100
        displayValue = formatted(currentValue)
    }

    private func setOperation(_ op: CalculatorButton) {
        currentValue = Double(displayValue) ?? 0
        storedValue = currentValue
        pendingOperation = op
        shouldResetDisplay = true
    }

    private func calculate() {
        let rhs = Double(displayValue) ?? 0
        var result: Double = storedValue
        switch pendingOperation {
        case .add:      result = storedValue + rhs
        case .subtract: result = storedValue - rhs
        case .multiply: result = storedValue * rhs
        case .divide:   result = rhs != 0 ? storedValue / rhs : 0
        default:        break
        }
        displayValue = formatted(result)
        currentValue = result
        storedValue = 0
        pendingOperation = nil
        shouldResetDisplay = true
    }

    private func appendDigit(_ digit: String) {
        if shouldResetDisplay {
            displayValue = digit
            shouldResetDisplay = false
        } else {
            displayValue = displayValue == "0" ? digit : displayValue + digit
        }
        currentValue = Double(displayValue) ?? 0
    }

    private func appendDecimal() {
        if shouldResetDisplay {
            displayValue = "0."
            shouldResetDisplay = false
        } else if !displayValue.contains(".") {
            displayValue += "."
        }
    }

    private func formatted(_ value: Double) -> String {
        value.truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(value))
            : String(value)
    }
}
