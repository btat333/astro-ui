//
//  CommandClient.swift
//  astro-ui (iOS)
//
//  Created by Ben Tatman on 7/29/22.
//

import Foundation
import SwiftUI

let commandEndpoint: URL = URL(string: "ws://192.168.86.250:5560")!
var commandTask = URLSession.shared.webSocketTask(with: commandEndpoint)

func sendPointCommand(ra: Double, dec: Double, completion: @escaping (_ :Bool) -> Void) {
    
    commandTask = URLSession.shared.webSocketTask(with: commandEndpoint)
    commandTask.resume()
    let message = URLSessionWebSocketTask.Message.string("POINT \(ra),\(dec)")
    print(message)
    commandTask.send(message) { error in
        
        if (error != nil) {
            DispatchQueue.main.async {
                completion(true)
            }
        } else {
            DispatchQueue.main.async {
                completion(false)
            }
        }
        commandTask.cancel()
    }
}

func startCommandSocket() {
    print("Starting command socket")
    commandTask = URLSession.shared.webSocketTask(with: commandEndpoint)
    commandTask.resume()
}

func pauseCommandSocket() {
    commandTask.suspend()
}

func cancelCommandSocket() {
    commandTask.cancel()
}
