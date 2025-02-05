import SwiftUI

struct SystolicAxisView: View {
    var body: some View {
        AxisText("170 -")
            .position(x: -20, y: 0)
        // 35%
        AxisText("135 -")
            .position(x: -20, y: 70)
        // 50%
        AxisText("120 -")
            .position(x: -20, y: 100)
        // 80%
        AxisText("90 -")
            .position(x: -20, y: 160)
        // 100%
        AxisText("70 -")
            .position(x: -20, y: 200)
    }
}

#Preview {
    SystolicAxisView()
}
