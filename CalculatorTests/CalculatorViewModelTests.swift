import XCTest
@testable import Calculator

final class CalculatorViewModelTests: XCTestCase {
    var vm: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        vm = CalculatorViewModel()
    }

    func testInitialDisplay() {
        XCTAssertEqual(vm.displayValue, "0")
    }

    func testAddition() {
        vm.tap(.one)
        vm.tap(.add)
        vm.tap(.two)
        vm.tap(.equals)
        XCTAssertEqual(vm.displayValue, "3")
    }

    func testSubtraction() {
        vm.tap(.nine)
        vm.tap(.subtract)
        vm.tap(.three)
        vm.tap(.equals)
        XCTAssertEqual(vm.displayValue, "6")
    }

    func testMultiplication() {
        vm.tap(.four)
        vm.tap(.multiply)
        vm.tap(.three)
        vm.tap(.equals)
        XCTAssertEqual(vm.displayValue, "12")
    }

    func testDivision() {
        vm.tap(.nine)
        vm.tap(.divide)
        vm.tap(.three)
        vm.tap(.equals)
        XCTAssertEqual(vm.displayValue, "3")
    }

    func testClear() {
        vm.tap(.five)
        vm.tap(.clear)
        XCTAssertEqual(vm.displayValue, "0")
    }

    func testPercent() {
        vm.tap(.five)
        vm.tap(.zero)
        vm.tap(.percent)
        XCTAssertEqual(vm.displayValue, "0.5")
    }

    func testNegative() {
        vm.tap(.five)
        vm.tap(.negative)
        XCTAssertEqual(vm.displayValue, "-5")
    }
}
