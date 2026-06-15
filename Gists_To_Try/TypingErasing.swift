//
//  TypingErasing.swift
//
//  Created by Amos Gyamfi on 15.6.2026.
//

import SwiftUI

struct OpencodeInXcode: View {
    var body: some View {
        PhaseAnimator(OpencodeTypingPhase.allCases) { phase in
            ZStack(alignment: .leading) {
                Text("Opencode")
                    .opacity(0)

                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(phase.prefix)

                    RoundedRectangle(cornerRadius: 1.5)
                        .foregroundStyle(.cyan)
                        .frame(width: 5, height: 62)
                        .opacity(phase.showsCursor ? 1 : 0)
                        .alignmentGuide(.firstTextBaseline) { context in
                            context[VerticalAlignment.center] + 18
                        }

                    Text("code")
                }
            }
            .font(.system(size: 64, weight: .bold, design: .monospaced))
        } animation: { phase in
            phase.animation
        }
    }
}

private enum OpencodeTypingPhase: CaseIterable {
    case opencodeCursorOn
    case opencodeCursorOff
    case opencodeCursorOnAgain
    case eraseToOpe
    case eraseToOpeCursorOff
    case eraseToOp
    case eraseToOpCursorOff
    case eraseToO
    case eraseToOCursorOff
    case eraseToCode
    case eraseToCodeCursorOff
    case writeX
    case xcodeCursorOff
    case xcodeCursorOn
    case xcodeCursorOffAgain
    case eraseXToCode
    case eraseXToCodeCursorOff
    case writeO
    case writeOCursorOff
    case writeOp
    case writeOpCursorOff
    case writeOpe
    case writeOpeCursorOff
    case writeOpen
    case writeOpenCursorOff

    var prefix: String {
        switch self {
        case .opencodeCursorOn, .opencodeCursorOff, .opencodeCursorOnAgain:
            "Open"
        case .eraseToOpe, .eraseToOpeCursorOff, .writeOpe, .writeOpeCursorOff:
            "Ope"
        case .eraseToOp, .eraseToOpCursorOff, .writeOp, .writeOpCursorOff:
            "Op"
        case .eraseToO, .eraseToOCursorOff, .writeO, .writeOCursorOff:
            "O"
        case .eraseToCode, .eraseToCodeCursorOff, .eraseXToCode, .eraseXToCodeCursorOff:
            ""
        case .writeX, .xcodeCursorOff, .xcodeCursorOn, .xcodeCursorOffAgain:
            "X"
        case .writeOpen, .writeOpenCursorOff:
            "Open"
        }
    }

    var showsCursor: Bool {
        switch self {
        case .opencodeCursorOff, .eraseToOpeCursorOff, .eraseToOpCursorOff,
             .eraseToOCursorOff, .eraseToCodeCursorOff, .xcodeCursorOff,
             .xcodeCursorOffAgain, .eraseXToCodeCursorOff, .writeOCursorOff,
             .writeOpCursorOff, .writeOpeCursorOff, .writeOpenCursorOff:
            false
        case .opencodeCursorOn, .opencodeCursorOnAgain, .eraseToOpe, .eraseToOp,
             .eraseToO, .eraseToCode, .writeX, .xcodeCursorOn, .eraseXToCode,
             .writeO, .writeOp, .writeOpe, .writeOpen:
            true
        }
    }

    var animation: Animation {
        switch self {
        case .opencodeCursorOn, .opencodeCursorOff, .opencodeCursorOnAgain,
             .xcodeCursorOff, .xcodeCursorOn, .xcodeCursorOffAgain:
            .easeInOut(duration: 0.32)
        case .eraseToOpe, .eraseToOp, .eraseToO, .eraseToCode, .writeX,
             .eraseXToCode, .writeO, .writeOp, .writeOpe, .writeOpen:
            .easeInOut(duration: 0.22)
        case .eraseToOpeCursorOff, .eraseToOpCursorOff, .eraseToOCursorOff,
             .eraseToCodeCursorOff, .eraseXToCodeCursorOff, .writeOCursorOff,
             .writeOpCursorOff, .writeOpeCursorOff, .writeOpenCursorOff:
            .easeInOut(duration: 0.12)
        }
    }
}

#Preview {
    OpencodeInXcode()
        .preferredColorScheme(.dark)
}
