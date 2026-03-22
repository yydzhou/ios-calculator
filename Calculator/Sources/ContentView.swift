import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals],
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                Spacer()

                // Display
                HStack {
                    Spacer()
                    Text(viewModel.displayValue)
                        .font(.system(size: 72, weight: .light))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .padding(.horizontal, 24)
                }

                // Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button) {
                                viewModel.tap(button)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
}
