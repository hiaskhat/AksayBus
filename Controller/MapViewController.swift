//
//  ViewController.swift
//  Aksay Bus
//
//  Created by Асхат Баймуканов on 14.08.2022.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController, MapManagerDelegate, CLLocationManagerDelegate {
    
    
    var mapManager = MapManager()
    var locationManager = CLLocationManager()
    
    let camera = GMSCameraPosition.camera(withLatitude: 51.17, longitude: 53.02, zoom: 13.0)
    //private var mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
               // Create a GMSCameraPosition that tells the map to display the
               // coordinate -33.86,151.20 at zoom level 6.
              

               // Creates a marker in the center of the map.
//               let marker = GMSMarker()
//               marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//               marker.title = "Sydney"
//               marker.snippet = "Australia"
//               marker.map = mapView
        mapManager.delegate = self
        locationManager.delegate = self
        drowTheRoute()
        mapManager.performRequest()
    }

    
    var mapView: GMSMapView?
    
    
    func drowTheRoute () {
//        let camera = GMSCameraPosition.camera(withLatitude: 51.17, longitude: 53.02, zoom: 13.0)
        let map = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView = map
        self.view.addSubview(map)
        
        let path = GMSMutablePath()
        path.addLatitude(51.1807398, longitude: 52.9815959)
        path.addLatitude(51.1795440, longitude: 52.9909532)
        path.addLatitude(51.1791984, longitude: 52.9952029)
        path.addLatitude(51.1802219, longitude: 52.9957569)
        path.addLatitude(51.1802808, longitude: 52.9962129)
        path.addLatitude(51.1795872, longitude: 53.0011659)
        path.addLatitude(51.1759955, longitude: 53.0165387)
        path.addLatitude(51.1758867, longitude: 53.0164663)
        path.addLatitude(51.1748853, longitude: 53.0155714)
        path.addLatitude(51.1730203, longitude: 53.0145793)
        path.addLatitude(51.1724906, longitude: 53.0149253)
        path.addLatitude(51.1719222, longitude: 53.0146306)
        //ул иксанова
        path.addLatitude(51.1724276, longitude: 53.0116799)
        path.addLatitude(51.1724931, longitude: 53.0107780)
        //иксанова-торговая
        path.addLatitude(51.1729005, longitude: 53.0018824)
        //школа 1
        path.addLatitude(51.1731161, longitude: 52.9948825)
        path.addLatitude(51.1732617, longitude: 52.9940363)
        path.addLatitude(51.1736375, longitude: 52.9932075)
        //иксанова-деповская
        path.addLatitude(51.1746900, longitude: 52.9781439)
        //поворот
        path.addLatitude(51.1747121, longitude: 52.9676343)
        //жд переезд
        //path.addLatitude(51.1688586, longitude: 52.9675528)
        path.addLatitude(51.1690784, longitude: 52.9674043)
        path.addLatitude(51.1685454, longitude: 52.9677242)
        path.addLatitude(51.1682122, longitude: 52.9683877)
        path.addLatitude(51.1680019, longitude: 52.9691752)
        path.addLatitude(51.1677536, longitude: 52.9695593)
        path.addLatitude(51.1677436, longitude: 52.9698163)
        path.addLatitude(51.1678274, longitude: 52.9699153)
//        path.addLatitude(51.1677121, longitude: 52.9676343)
        path.addLatitude(51.1678653, longitude: 52.9703926)
        path.addLatitude(51.1678378, longitude: 52.9712077)
        //уйтолы
        path.addLatitude(51.1679118, longitude: 52.9757007)
        //советская-бостандык
        path.addLatitude(51.1680085, longitude: 52.9780738)
        //советская-западная
        path.addLatitude(51.1679671, longitude: 52.9792436)
        path.addLatitude(51.1679969, longitude: 52.9800030)
        //советская-8марта
        path.addLatitude(51.1678401, longitude: 52.9818497)
        path.addLatitude(51.1677642, longitude: 52.9832062)
        //советская-линейная
        path.addLatitude(51.1677760, longitude: 52.9887825)
        //советская-вокзал
        path.addLatitude(51.1678756, longitude: 52.9969566)
        path.addLatitude(51.1678334, longitude: 53.0013115)
        //советская-нарсуд
        path.addLatitude(51.1677995, longitude: 53.0023857)
        path.addLatitude(51.1673468, longitude: 53.0022697)
        //начало железнодор-я
        path.addLatitude(51.1662036, longitude: 53.0018452)
        path.addLatitude(51.1661742, longitude: 53.0025396)
        //жд-кружка
        path.addLatitude(51.1661315, longitude: 53.0097772)
        path.addLatitude(51.1660239, longitude: 53.0123089)
        //мечеть
        path.addLatitude(51.1659013, longitude: 53.0156687)
        //начало парка
        path.addLatitude(51.1656377, longitude: 53.0189342)
        //ост кристина
        path.addLatitude(51.1656948, longitude: 53.0288051)
        //5-3
        path.addLatitude(51.1656906, longitude: 53.0308902)
        //5-2
        path.addLatitude(51.1655546, longitude: 53.0318387)
        //5-1-32
        path.addLatitude(51.1653620, longitude: 53.0325931)
        //5-31
        path.addLatitude(51.1652199, longitude: 53.0330463)
        //5-30
        path.addLatitude(51.1648179, longitude: 53.0339174)
        //5-37-27
        path.addLatitude(51.1639168, longitude: 53.0354751)
        //5-27
        path.addLatitude(51.1635497, longitude: 53.0359750)
        //коралл светофор
        path.addLatitude(51.1633327, longitude: 53.0364538)
        //5-24 байтерек
        path.addLatitude(51.1626494, longitude: 53.0356240)
        //маг восток
        path.addLatitude(51.1617992, longitude: 53.0344222)
        //5 поворот на односторонку
        path.addLatitude(51.1594521, longitude: 53.0308617)
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 4
        polyline.map = mapView
    }
    

    func didUpdateMapData(_ mapManager: MapManager, traccarInfo: TraccarModel) {
        DispatchQueue.main.async {
            let position = CLLocationCoordinate2D(latitude: traccarInfo.latitude, longitude: traccarInfo.longitude)
            let marker = GMSMarker(position: position)
            marker.title = "Тройка"
            marker.map = self.mapView
            print(marker)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

}

