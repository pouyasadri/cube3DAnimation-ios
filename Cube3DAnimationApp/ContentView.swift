//
//  ContentView.swift
//  Cube3DAnimationApp
//
//  Created by Pouya Sadri on 19/01/2024.
//

import SwiftUI
//MARK: - ContentView
struct ContentView: View {
    var body: some View {
		FinalView()
    }
}

#Preview {
    ContentView()
}

struct FinalView: View {
	var body: some View {
		ZStack{
			Color.black
				.ignoresSafeArea()
			CubesView()
				.offset(x:0, y: -95)
			bottomPanel()
		}
	}
	// Bottom panel with welcome text and arrow
	@ViewBuilder
	private func bottomPanel() -> some View{
		ZStack{
			RoundedRectangle(cornerRadius: 75)
				.frame(width:450,height: 400)
				.foregroundStyle(.gray).opacity(0.2)
				.offset(x:0,y:350)
			
			VStack{
				Text("WELCOME")
					.font(.title)
					.fontWeight(.regular)
					.foregroundStyle(Color.white)
				arrowCircle()
			}
			.offset(x:0,y:300)
		}
	}
	
	//Arrow inside a circle
	@ViewBuilder
	private func arrowCircle() -> some View{
		ZStack{
			Circle()
				.frame(width: 75,height: 75)
				.foregroundStyle(.clear)
				.overlay(Circle().stroke(Color.white,lineWidth: 2))
			
			Image(systemName: "arrow.right")
				.resizable()
				.frame(width: 35,height: 30)
				.foregroundStyle(.white)
		}
	}
}

//MARK: - CubesView
struct CubesView:View {
	var body: some View {
		ZStack{
			ForEach(0 ..< 10){index in
					CubeSetView()
					.offset(x:100)
					.rotationEffect(.degrees(Double(index) * 60 ))
				
			}
		}
	}
}

//MARK: - CubeSet View

struct CubeSetView : View {
	@ObservedObject var viewModel = CubeViewModel()
	
	var body: some View {
		ZStack{
			ForEach(0..<viewModel.allCubes.count, id : \.self){index in
				cubeView(index:index)
				
			}
		}
		.onAppear(perform: viewModel.startRotation)
	}
	
	private func cubeView(index: Int) -> some View{
		let offset = viewModel.allIndicies[index]
		return viewModel.allCubes[index].view
			.offset(x: offset.0,y: offset.1)
			.zIndex(offset.2)
	}
}
