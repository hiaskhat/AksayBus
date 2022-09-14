//
//  MapManager.swift
//  Aksay Bus
//
//  Created by Асхат Баймуканов on 16.08.2022.
//

import Foundation

protocol MapManagerDelegate {
    func didUpdateMapData(_ mapManager: MapManager, traccarInfo: TraccarModel)
    func didFailWithError(error: Error)
}


struct MapManager {
    
    let url = "https://server.traccar.org/api/positions"
    
    let username = "askhateam@yandex.ru"
    let password = ""
    
    
    var delegate: MapManagerDelegate?
    
    func performRequest () {

        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let authData = ("\(username):\(password)").data(using: .utf8)!.base64EncodedString()
            request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print("There is an error with server data \(error)")
                }
                if let response = response {
                    print(response)
                }
                if let safeData = data {
                    if let traccarInfo = parseJSON(safeData) {
                        self.delegate?.didUpdateMapData(self, traccarInfo: traccarInfo)
                    }
                }
            }
            task.resume()
        }

    }
    
    func parseJSON(_ traccarData: Data) -> TraccarModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([TraccarData].self, from: traccarData)
            let lat = decodedData[0].latitude
            let lon = decodedData[0].longitude
            
            let traccarInfo = TraccarModel(latitude: lat, longitude: lon)
            //print(traccarInfo)
            return traccarInfo
        } catch {
            print("error parsing data \(error)")
            return nil
        }
    }
    
    
    
    
    
    
}
