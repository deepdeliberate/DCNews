//
//  LoadFailedView.swift
//  DCNews
//
//  Created by Naman Deep on 18/12/25.
//

import SwiftUI

struct LoadFailedView: View {
    var error: (any Error)?
    var retry: () async -> Void
    
    var body: some View {
        ContentUnavailableView{
            Text("Load Error")
                .font(.headline)
        } description: {
            Text ("There was an Error loading the articles.")
        } actions: {
            Button ("Retry") {
                Task{
                    await retry()
                }
            }
        }
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "DCTest", code:1)){
        // Do nothing
    }
}
