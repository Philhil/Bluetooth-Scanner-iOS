//
//  ScanTableViewController.swift
//  Bluetooth-Scanner
//
//  Created by admin on 10.04.17.
//  Copyright © 2017 DHBW. All rights reserved.
//

import UIKit
import CoreBluetooth

class ScanTableViewController: UITableViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
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
    
    //über storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as UIViewController
        
        let index = tableView.indexPathForSelectedRow?.row
        
        if (index != nil && manager != nil) {
            let device = devices[index!].peripheral
            device.delegate = controller as? CBPeripheralDelegate //TODO set delegate to seque tableview and show content if it arrives
            manager?.connect(device, options: nil)
            
            //controller.loadData...
        }
    }
    
    func stopScanBTDevices() {
        manager?.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover device: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        device.readRSSI()
        
        if !devices.contains(where: { $0.uuid == device.identifier }) {
            
            let newDevice = BTDevice(peripheral: device, name: device.name, uuid: device.identifier, rssi: nil)
            devices.append(newDevice)
            //central.connect(device, options: nil)
        }
        
        self.tableView.reloadData()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        
            if  let i = devices.index(where: { $0.uuid == peripheral.identifier }) {
                devices[i].rssi = RSSI
            }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if peripheral.services != nil {
            print(peripheral.services?.first?.uuid.uuidString ?? "")
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case CBManagerState.poweredOn:
            //manager?.scanForPeripherals(withServices: [CBUUID.init(string: "DFB0")], options: nil)
            manager?.scanForPeripherals(withServices: nil, options: nil)
        default:
            ()
        }

    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?){
        print(error as Any)
    }
    
}
