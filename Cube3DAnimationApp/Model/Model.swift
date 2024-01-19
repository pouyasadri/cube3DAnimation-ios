//
//  Model.swift
//  Cube3DAnimationApp
//
//  Created by Pouya Sadri on 19/01/2024.
//

import SwiftUI

//MARK: - AllCubes Enum
enum AllCubes: CaseIterable{
	static var indexOffset : Int = 0
	
	case one, two, three, four, five, clear
	
	var view: AnyView{
		switch self{
			case .one, .two, .three, .four, .five:
				return AnyView(Image(name()).resizable().frame(width: 80,height: 80))
			default:
				return AnyView(EmptyView())
		}
	}
	
	private func name() -> String{
		switch self {
			case .one: return "green"
			case .two: return "yellow"
			case .three: return "red"
			case .four: return "blue"
			case .five: return "orange"
			default: return ""
		}
	}
}
