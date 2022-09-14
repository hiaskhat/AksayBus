//
//  WSManager.swift
//  Aksay Bus
//
//  Created by Асхат Баймуканов on 24.08.2022.
//

import Foundation

class WSManager: NSObject, URLSessionTaskDelegate {
 
    
    
    
    public static let shared = WSManager()
    

    
    
    public func connectToWebSocket() {
        let session = URLSession(configuration: .default)
        let task = session.webSocketTask(with: URL(string: "wss://server.traccar.org/api/socket")!) 
        task.resume()
        //self.receiveData() { _ in }
    }
    

    
    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping @Sendable (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        print("received task challenge")
    }

}
