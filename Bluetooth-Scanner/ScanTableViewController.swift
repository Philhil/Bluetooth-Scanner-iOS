//
//  ScanTableViewController.swift
//  Bluetooth-Scanner
//
//  Created by admin on 10.04.17.
//  Copyright © 2017 DHBW. All rights reserved.
//

import UIKit
import CoreBluetooth

class ScanTableViewController: UITableViewController, CBCentralManagerDelegate {
    
    var devices:[BTDevice] = []
    var manager:CBCentralManager? = nil
    var mainCharacteristic:CBCharacteristic? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 300
        
        manager = CBCentralManager(delegate: self, queue: nil);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        manager?.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScanTableViewCell", for: indexPath) as! ScanTableViewCell
        
        let device = devices[indexPath.row]
        
        cell.LabelId.text = device.uuid?.uuidString
        cell.LabelName?.text = device.name
        cell.LabelRSSI?.text = device.rssi?.stringValue
        
        return cell
    }

    func stopScanBTDevices() {
        manager?.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover device: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        device.readRSSI()
        
        if !devices.contains(where: { $0.uuid == device.identifier }) {
            let newDevice = BTDevice(name: device.name, uuid: device.identifier, rssi: nil)
            devices.append(newDevice)
        }
        
        self.tableView.reloadData()
    }
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        
            if  let i = devices.index(where: { $0.uuid == peripheral.identifier }) {
                devices[i].rssi = RSSI
            }
        
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case CBManagerState.poweredOn:
            //manager?.scanForPeripherals(withServices: [CBUUID.init(string: "DFB0")], options: nil)
            manager?.scanForPeripherals(withServices: nil, options: nil)

            
            
            //scan only 40 seconds
            
            //Timer.scheduledTimer(timeInterval: 40.0, target: self, selector: #selector(self.stopScanBTDevices), userInfo: nil, repeats: false)
        default:
            ()
        }

    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        peripheral.discoverServices(nil)
        
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?){
        print(error as Any)
    }
    
}
