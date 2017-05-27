//
//  DetailTableViewController.swift
//  Bluetooth-Scanner
//
//  Created by admin on 24.05.17.
//  Copyright © 2017 DHBW. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class DetailTableViewController: UITableViewController, CBPeripheralDelegate {

    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services! {
            let thisService = service as CBService
            
            print(thisService.uuid.uuidString)
            peripheral.discoverCharacteristics(nil, for: thisService)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        for characteristic in service.characteristics! {
            let thisCharacteristic = characteristic as CBCharacteristic
            peripheral.setNotifyValue(true, for: thisCharacteristic)
            
            print("\r\n")
            print("Char: serviceUUID \(service.uuid.uuidString) Discover char \(thisCharacteristic)")
            print("Char: charUUID \(thisCharacteristic.uuid.uuidString)")
            if let desc = thisCharacteristic.value?.description {
                print("Description: " + desc)
            }
            
            let data = Data()
            peripheral.writeValue(data, for: thisCharacteristic, type: CBCharacteristicWriteType.withoutResponse)

            print(data)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        
        print("\r\n")
        print("Update notification Char: service \(characteristic.service.uuid.uuidString) Discover char \(characteristic)")
        print("Update notification Char: UUID \(characteristic.uuid.uuidString)")
        if let desc = characteristic.value?.description {
            print("Description: " + desc)
        }
        
    }
}
