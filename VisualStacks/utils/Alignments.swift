//
//  Alignments.swift
//  VisualStacks
//
//  Created by Nessa Kucuk, Turker on 10/14/24.
//

import Foundation
import SwiftUI

enum HAlignment: Int {
    case leading = 1
    case center = 2
    case trailing = 3
    
    var alignment: HorizontalAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
    
    var frameAlignment: Alignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
    
    var textDescription: String {
        switch self {
        case .leading: return "left"
        case .center: return "center"
        case .trailing: return "right"
        }
    }
}

enum VAlignment: Int {
    case top = 1
    case center = 2
    case bottom = 3
    
    var alignment: VerticalAlignment {
        switch self {
        case .top: return .top
        case .center: return .center
        case .bottom: return .bottom
        }
    }
    
    var frameAlignment: Alignment {
        switch self {
        case .top: return .top
        case .center: return .center
        case .bottom: return .bottom
        }
    }
    
    var textDescription: String {
        switch self {
        case .top: return "top"
        case .center: return "center"
        case .bottom: return "bottom"
        }
    }
}

enum SpacerLocation: Int {
    case notPresent = 0
    case top = 1
    case right = 2
    case bottom = 3
    case left = 4
}
