//
//  BTDevice.swift
//  Bluetooth-Scanner
//
//  Created by admin on 24.04.17.
//  Copyright © 2017 DHBW. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTDevice {
    var name:String
    var uuid:UUID? = nil
    var rssi:NSNumber? = nil
    var peripheral:CBPeripheral
    
    public init(peripheral:CBPeripheral, name:String?, uuid:UUID?, rssi:NSNumber?) {
        self.name = name ?? ""
        self.uuid = uuid
        self.rssi = rssi
        self.peripheral = peripheral
    }
}
