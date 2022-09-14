//
//  RouteViewController.swift
//  Aksay Bus
//
//  Created by Асхат Баймуканов on 16.08.2022.
//

import Foundation
import UIKit

class RouteViewController: UIViewController {
    
    
    var mapManager = MapManager()
    private var webSocket: URLSessionWebSocketTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       //WSManager.shared.connectToWebSocket()
        //WSManager.shared.receiveData()
    }
    
    @IBAction func requestTapped(_ sender: UIButton) {
        mapManager.performRequest()
     
        
    }
    
    @IBAction func getTapped(_ sender: UIButton) {
    }
    
    func ping () {
        webSocket?.sendPing { error in
            if let error = error {
                print("Ping error \(error)")
            }
        }
    }
    
    func close () {
        webSocket?.cancel(with: .goingAway, reason: "Demo ended".data(using: .utf8))
    }
    
    func send () {
        
    }
    
    func receive () {
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Did connect to Socket")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Did close connection")
    }
    
    
    
    
    

}
