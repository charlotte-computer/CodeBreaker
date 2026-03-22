//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Charlotte Wheeler on 22/03/2026.
//

import SwiftUI

enum Match: Int, CaseIterable {
    case exact
    case nomatch
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match]
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)

            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: {match in match == .exact })
        let foundCount: Int = matches.count(where: {match in match != .nomatch})
        return Circle()
            .fill(exactCount > peg ? .primary : Color.clear)
            .strokeBorder(foundCount > peg ? .primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch, .inexact])
}
