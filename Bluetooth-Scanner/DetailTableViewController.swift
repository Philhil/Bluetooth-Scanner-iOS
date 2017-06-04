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

    @IBOutlet var detailTable: UITableView!
    var CharacteristicsTable = [String]()
    
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
            
            //print(thisCharacteristic.description)
            print(thisCharacteristic.properties)
            
            let preupdateCount = CharacteristicsTable.count
            
            switch thisCharacteristic.uuid.uuidString {
            case "2A7E":
                CharacteristicsTable.append("Aerobic Heart Rate Lower Limit: "+thisCharacteristic.properties.rawValue.description)
            case "2A84":
                CharacteristicsTable.append("Aerobic Heart Rate Upper Limit: "+thisCharacteristic.properties.rawValue.description)
            case "2A7F":
                CharacteristicsTable.append("Aerobic Threshold: "+thisCharacteristic.properties.rawValue.description)
            case "2A80":
                CharacteristicsTable.append("Age: "+thisCharacteristic.properties.rawValue.description)
            case "2A5A":
                CharacteristicsTable.append("Aggregate: "+thisCharacteristic.properties.rawValue.description)
            case "2A43":
                CharacteristicsTable.append("Alert Category ID: "+thisCharacteristic.properties.rawValue.description)
            case "2A42":
                CharacteristicsTable.append("Alert Category ID Bit Mask: "+thisCharacteristic.properties.rawValue.description)
            case "2A06":
                CharacteristicsTable.append("Alert Level: "+thisCharacteristic.properties.rawValue.description)
            case "2A44":
                CharacteristicsTable.append("Alert Notification Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A3F":
                CharacteristicsTable.append("Alert Status: "+thisCharacteristic.properties.rawValue.description)
            case "2AB3":
                CharacteristicsTable.append("Altitude: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A81":
                CharacteristicsTable.append("Anaerobic Heart Rate Lower Limit: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A82":
                CharacteristicsTable.append("Anaerobic Heart Rate Upper Limit: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A83":
                CharacteristicsTable.append("Anaerobic Threshold: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A58":
                CharacteristicsTable.append("Analog: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A73":
                CharacteristicsTable.append("Apparent Wind Direction: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A72":
                CharacteristicsTable.append("Apparent Wind Speed: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A01":
                CharacteristicsTable.append("Appearance: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA3":
                CharacteristicsTable.append("Barometric Pressure Trend: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A19":
                CharacteristicsTable.append("Battery Level: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A49":
                CharacteristicsTable.append("Blood Pressure Feature: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A35":
                CharacteristicsTable.append("Blood Pressure Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A9B":
                CharacteristicsTable.append("Body Composition Feature: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A9C":
                CharacteristicsTable.append("Body Composition Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A38":
                CharacteristicsTable.append("Body Sensor Location: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA4":
                CharacteristicsTable.append("Bond Management Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA5":
                CharacteristicsTable.append("Bond Management Feature: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A22":
                CharacteristicsTable.append("Boot Keyboard Input Report: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A32":
                CharacteristicsTable.append("Boot Keyboard Output Report: "+thisCharacteristic.properties.rawValue.description)
            case "0x2A33":
                CharacteristicsTable.append("Boot Mouse Input Report: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA6":
                CharacteristicsTable.append("Central Address Resolution: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA8":
                CharacteristicsTable.append("CGM Feature: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AA7":
                CharacteristicsTable.append("CGM Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "0x2AAB":
                CharacteristicsTable.append("CGM Session Run Time: "+thisCharacteristic.properties.rawValue.description)
            case "2AAA": CharacteristicsTable.append("CGM Session Start Time: "+thisCharacteristic.properties.rawValue.description)
            case "2AAC": CharacteristicsTable.append("CGM Specific Ops Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2AA9": CharacteristicsTable.append("CGM Status: "+thisCharacteristic.properties.rawValue.description)
            case "2ACE": CharacteristicsTable.append("Cross Trainer Data: "+thisCharacteristic.properties.rawValue.description)
            case "2A5C": CharacteristicsTable.append("CSC Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A5B": CharacteristicsTable.append("CSC Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A2B": CharacteristicsTable.append("Current Time: "+thisCharacteristic.properties.rawValue.description)
            case "2A66": CharacteristicsTable.append("Cycling Power Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A65": CharacteristicsTable.append("Cycling Power Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A63": CharacteristicsTable.append("Cycling Power Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A64": CharacteristicsTable.append("Cycling Power Vector: "+thisCharacteristic.properties.rawValue.description)
            case "2A99": CharacteristicsTable.append("Database Change Increment: "+thisCharacteristic.properties.rawValue.description)
            case "2A85": CharacteristicsTable.append("Date of Birth: "+thisCharacteristic.properties.rawValue.description)
            case "2A86": CharacteristicsTable.append("Date of Threshold Assessment: "+thisCharacteristic.properties.rawValue.description)
            case "2A08": CharacteristicsTable.append("Date Time: "+thisCharacteristic.properties.rawValue.description)
            case "2A0A": CharacteristicsTable.append("Day Date Time: "+thisCharacteristic.properties.rawValue.description)
            case "2A09": CharacteristicsTable.append("Day of Week: "+thisCharacteristic.properties.rawValue.description)
            case "2A7D": CharacteristicsTable.append("Descriptor Value Changed: "+thisCharacteristic.properties.rawValue.description)
            case "2A00": CharacteristicsTable.append("Device Name: "+thisCharacteristic.properties.rawValue.description)
            case "2A7B": CharacteristicsTable.append("Dew Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A56": CharacteristicsTable.append("Digital: "+thisCharacteristic.properties.rawValue.description)
            case "2A0D": CharacteristicsTable.append("DST Offset: "+thisCharacteristic.properties.rawValue.description)
            case "2A6C": CharacteristicsTable.append("Elevation: "+thisCharacteristic.properties.rawValue.description)
            case "2A87": CharacteristicsTable.append("Email Address: "+thisCharacteristic.properties.rawValue.description)
            case "2A0C": CharacteristicsTable.append("Exact Time 256: "+thisCharacteristic.properties.rawValue.description)
            case "2A88": CharacteristicsTable.append("Fat Burn Heart Rate Lower Limit: "+thisCharacteristic.properties.rawValue.description)
            case "2A89": CharacteristicsTable.append("Fat Burn Heart Rate Upper Limit: "+thisCharacteristic.properties.rawValue.description)
            case "2A26": CharacteristicsTable.append("Firmware Revision String: "+thisCharacteristic.properties.rawValue.description)
            case "2A8A": CharacteristicsTable.append("First Name: "+thisCharacteristic.properties.rawValue.description)
            case "2AD9": CharacteristicsTable.append("Fitness Machine Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2ACC": CharacteristicsTable.append("Fitness Machine Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2ADA": CharacteristicsTable.append("Fitness Machine Status: "+thisCharacteristic.properties.rawValue.description)
            case "2A8B": CharacteristicsTable.append("Five Zone Heart Rate Limits: "+thisCharacteristic.properties.rawValue.description)
            case "2AB2": CharacteristicsTable.append("Floor Number: "+thisCharacteristic.properties.rawValue.description)
            case "2A8C": CharacteristicsTable.append("Gender: "+thisCharacteristic.properties.rawValue.description)
            case "2A51": CharacteristicsTable.append("Glucose Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A18": CharacteristicsTable.append("Glucose Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A34": CharacteristicsTable.append("Glucose Measurement Context: "+thisCharacteristic.properties.rawValue.description)
            case "2A74": CharacteristicsTable.append("Gust Factor: "+thisCharacteristic.properties.rawValue.description)
            case "2A27": CharacteristicsTable.append("Hardware Revision String: "+thisCharacteristic.properties.rawValue.description)
            case "2A39": CharacteristicsTable.append("Heart Rate Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A8D": CharacteristicsTable.append("Heart Rate Max: "+thisCharacteristic.properties.rawValue.description)
            case "2A37": CharacteristicsTable.append("Heart Rate Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A7A": CharacteristicsTable.append("Heat Index: "+thisCharacteristic.properties.rawValue.description)
            case "2A8E": CharacteristicsTable.append("Height: "+thisCharacteristic.properties.rawValue.description)
            case "2A4C": CharacteristicsTable.append("HID Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A4A": CharacteristicsTable.append("HID Information: "+thisCharacteristic.properties.rawValue.description)
            case "2A8F": CharacteristicsTable.append("Hip Circumference: "+thisCharacteristic.properties.rawValue.description)
            case "2ABA": CharacteristicsTable.append("HTTP Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2AB9": CharacteristicsTable.append("HTTP Entity Body: "+thisCharacteristic.properties.rawValue.description)
            case "2AB7": CharacteristicsTable.append("HTTP Headers: "+thisCharacteristic.properties.rawValue.description)
            case "2AB8": CharacteristicsTable.append("HTTP Status Code: "+thisCharacteristic.properties.rawValue.description)
            case "2ABB": CharacteristicsTable.append("HTTPS Security: "+thisCharacteristic.properties.rawValue.description)
            case "2A6F": CharacteristicsTable.append("Humidity: "+thisCharacteristic.properties.rawValue.description)
            case "2A2A": CharacteristicsTable.append("IEEE 11073-20601 Regulatory Certification Data List: "+thisCharacteristic.properties.rawValue.description)
            case "2AD2": CharacteristicsTable.append("Indoor Bike Data: "+thisCharacteristic.properties.rawValue.description)
            case "2AAD": CharacteristicsTable.append("Indoor Positioning Configuration: "+thisCharacteristic.properties.rawValue.description)
            case "2A36": CharacteristicsTable.append("Intermediate Cuff Pressure: "+thisCharacteristic.properties.rawValue.description)
            case "2A1E": CharacteristicsTable.append("Intermediate Temperature: "+thisCharacteristic.properties.rawValue.description)
            case "2A77": CharacteristicsTable.append("Irradiance: "+thisCharacteristic.properties.rawValue.description)
            case "2AA2": CharacteristicsTable.append("Language: "+thisCharacteristic.properties.rawValue.description)
            case "2A90": CharacteristicsTable.append("Last Name: "+thisCharacteristic.properties.rawValue.description)
            case "2AAE": CharacteristicsTable.append("Latitude: "+thisCharacteristic.properties.rawValue.description)
            case "2A6B": CharacteristicsTable.append("LN Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A6A": CharacteristicsTable.append("LN Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2AB1": CharacteristicsTable.append("Local East Coordinate: "+thisCharacteristic.properties.rawValue.description)
            case "2AB0": CharacteristicsTable.append("Local North Coordinate: "+thisCharacteristic.properties.rawValue.description)
            case "2A0F": CharacteristicsTable.append("Local Time Information: "+thisCharacteristic.properties.rawValue.description)
            case "2A67": CharacteristicsTable.append("Location and Speed: "+thisCharacteristic.properties.rawValue.description)
            case "2AB5": CharacteristicsTable.append("Location Name: "+thisCharacteristic.properties.rawValue.description)
            case "2AAF": CharacteristicsTable.append("Longitude: "+thisCharacteristic.properties.rawValue.description)
            case "2A2C": CharacteristicsTable.append("Magnetic Declination: "+thisCharacteristic.properties.rawValue.description)
            case "2AA0": CharacteristicsTable.append("Magnetic Flux Density - 2D: "+thisCharacteristic.properties.rawValue.description)
            case "2AA1": CharacteristicsTable.append("Magnetic Flux Density - 3D: "+thisCharacteristic.properties.rawValue.description)
            case "2A29": CharacteristicsTable.append("Manufacturer Name String: "+thisCharacteristic.properties.rawValue.description)
            case "2A91": CharacteristicsTable.append("Maximum Recommended Heart Rate: "+thisCharacteristic.properties.rawValue.description)
            case "2A21": CharacteristicsTable.append("Measurement Interval: "+thisCharacteristic.properties.rawValue.description)
            case "2A24": CharacteristicsTable.append("Model Number String: "+thisCharacteristic.properties.rawValue.description)
            case "2A68": CharacteristicsTable.append("Navigation: "+thisCharacteristic.properties.rawValue.description)
            case "2A46": CharacteristicsTable.append("New Alert: "+thisCharacteristic.properties.rawValue.description)
            case "2AC5": CharacteristicsTable.append("Object Action Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2AC8": CharacteristicsTable.append("Object Changed: "+thisCharacteristic.properties.rawValue.description)
            case "2AC1": CharacteristicsTable.append("Object First-Created: "+thisCharacteristic.properties.rawValue.description)
            case "2AC3": CharacteristicsTable.append("Object ID: "+thisCharacteristic.properties.rawValue.description)
            case "2AC2": CharacteristicsTable.append("Object Last-Modified: "+thisCharacteristic.properties.rawValue.description)
            case "2AC6": CharacteristicsTable.append("Object List Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2AC7": CharacteristicsTable.append("Object List Filter: "+thisCharacteristic.properties.rawValue.description)
            case "2ABE": CharacteristicsTable.append("Object Name: "+thisCharacteristic.properties.rawValue.description)
            case "2AC4": CharacteristicsTable.append("Object Properties: "+thisCharacteristic.properties.rawValue.description)
            case "2AC0": CharacteristicsTable.append("Object Size: "+thisCharacteristic.properties.rawValue.description)
            case "2ABF": CharacteristicsTable.append("Object Type: "+thisCharacteristic.properties.rawValue.description)
            case "2ABD": CharacteristicsTable.append("OTS Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A04": CharacteristicsTable.append("Peripheral Preferred Connection Parameters: "+thisCharacteristic.properties.rawValue.description)
            case "2A02": CharacteristicsTable.append("Peripheral Privacy Flag: "+thisCharacteristic.properties.rawValue.description)
            case "2A5F": CharacteristicsTable.append("PLX Continuous Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A60": CharacteristicsTable.append("PLX Features: "+thisCharacteristic.properties.rawValue.description)
            case "2A5E": CharacteristicsTable.append("PLX Spot-Check Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A50": CharacteristicsTable.append("PnP ID: "+thisCharacteristic.properties.rawValue.description)
            case "2A75": CharacteristicsTable.append("Pollen Concentration: "+thisCharacteristic.properties.rawValue.description)
            case "2A69": CharacteristicsTable.append("Position Quality: "+thisCharacteristic.properties.rawValue.description)
            case "2A6D": CharacteristicsTable.append("Pressure: "+thisCharacteristic.properties.rawValue.description)
            case "2A4E": CharacteristicsTable.append("Protocol Mode: "+thisCharacteristic.properties.rawValue.description)
            case "2A78": CharacteristicsTable.append("Rainfall: "+thisCharacteristic.properties.rawValue.description)
            case "2A03": CharacteristicsTable.append("Reconnection Address: "+thisCharacteristic.properties.rawValue.description)
            case "2A52": CharacteristicsTable.append("Record Access Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A14": CharacteristicsTable.append("Reference Time Information: "+thisCharacteristic.properties.rawValue.description)
            case "2A4D": CharacteristicsTable.append("Report: "+thisCharacteristic.properties.rawValue.description)
            case "2A4B": CharacteristicsTable.append("Report Map: "+thisCharacteristic.properties.rawValue.description)
            case "2AC9": CharacteristicsTable.append("Resolvable Private Address Only: "+thisCharacteristic.properties.rawValue.description)
            case "2A92": CharacteristicsTable.append("Resting Heart Rate: "+thisCharacteristic.properties.rawValue.description)
            case "2A40": CharacteristicsTable.append("Ringer Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A41": CharacteristicsTable.append("Ringer Setting: "+thisCharacteristic.properties.rawValue.description)
            case "2AD1": CharacteristicsTable.append("Rower Data: "+thisCharacteristic.properties.rawValue.description)
            case "2A54": CharacteristicsTable.append("RSC Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A53": CharacteristicsTable.append("RSC Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A55": CharacteristicsTable.append("SC Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A4F": CharacteristicsTable.append("Scan Interval Window: "+thisCharacteristic.properties.rawValue.description)
            case "2A31": CharacteristicsTable.append("Scan Refresh: "+thisCharacteristic.properties.rawValue.description)
            case "2A5D": CharacteristicsTable.append("Sensor Location: "+thisCharacteristic.properties.rawValue.description)
            case "2A25": CharacteristicsTable.append("Serial Number String: "+thisCharacteristic.properties.rawValue.description)
            case "2A05": CharacteristicsTable.append("Service Changed: "+thisCharacteristic.properties.rawValue.description)
            case "2A28": CharacteristicsTable.append("Software Revision String: "+thisCharacteristic.properties.rawValue.description)
            case "2A93": CharacteristicsTable.append("Sport Type for Aerobic and Anaerobic Thresholds: "+thisCharacteristic.properties.rawValue.description)
            case "2AD0": CharacteristicsTable.append("Stair Climber Data: "+thisCharacteristic.properties.rawValue.description)
            case "2ACF": CharacteristicsTable.append("Step Climber Data: "+thisCharacteristic.properties.rawValue.description)
            case "2AD7": CharacteristicsTable.append("Supported Heart Rate Range: "+thisCharacteristic.properties.rawValue.description)
            case "2AD5": CharacteristicsTable.append("Supported Inclination Range: "+thisCharacteristic.properties.rawValue.description)
            case "2A47": CharacteristicsTable.append("Supported New Alert Category: "+thisCharacteristic.properties.rawValue.description)
            case "2AD8": CharacteristicsTable.append("Supported Power Range: "+thisCharacteristic.properties.rawValue.description)
            case "2AD6": CharacteristicsTable.append("Supported Resistance Level Range: "+thisCharacteristic.properties.rawValue.description)
            case "2AD4": CharacteristicsTable.append("Supported Speed Range: "+thisCharacteristic.properties.rawValue.description)
            case "2A48": CharacteristicsTable.append("Supported Unread Alert Category: "+thisCharacteristic.properties.rawValue.description)
            case "2A23": CharacteristicsTable.append("System ID: "+thisCharacteristic.properties.rawValue.description)
            case "2ABC": CharacteristicsTable.append("TDS Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A6E": CharacteristicsTable.append("Temperature: "+thisCharacteristic.properties.rawValue.description)
            case "2A1C": CharacteristicsTable.append("Temperature Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A1D": CharacteristicsTable.append("Temperature Type: "+thisCharacteristic.properties.rawValue.description)
            case "2A94": CharacteristicsTable.append("Three Zone Heart Rate Limits: "+thisCharacteristic.properties.rawValue.description)
            case "2A12": CharacteristicsTable.append("Time Accuracy: "+thisCharacteristic.properties.rawValue.description)
            case "2A13": CharacteristicsTable.append("Time Source: "+thisCharacteristic.properties.rawValue.description)
            case "2A16": CharacteristicsTable.append("Time Update Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A17": CharacteristicsTable.append("Time Update State: "+thisCharacteristic.properties.rawValue.description)
            case "2A11": CharacteristicsTable.append("Time with DST: "+thisCharacteristic.properties.rawValue.description)
            case "2A0E": CharacteristicsTable.append("Time Zone: "+thisCharacteristic.properties.rawValue.description)
            case "2AD3": CharacteristicsTable.append("Training Status: "+thisCharacteristic.properties.rawValue.description)
            case "2ACD": CharacteristicsTable.append("Treadmill Data: "+thisCharacteristic.properties.rawValue.description)
            case "2A71": CharacteristicsTable.append("True Wind Direction: "+thisCharacteristic.properties.rawValue.description)
            case "2A70": CharacteristicsTable.append("True Wind Speed: "+thisCharacteristic.properties.rawValue.description)
            case "2A95": CharacteristicsTable.append("Two Zone Heart Rate Limit: "+thisCharacteristic.properties.rawValue.description)
            case "2A07": CharacteristicsTable.append("Tx Power Level: "+thisCharacteristic.properties.rawValue.description)
            case "2AB4": CharacteristicsTable.append("Uncertainty: "+thisCharacteristic.properties.rawValue.description)
            case "2A45": CharacteristicsTable.append("Unread Alert Status: "+thisCharacteristic.properties.rawValue.description)
            case "2AB6": CharacteristicsTable.append("URI: "+thisCharacteristic.properties.rawValue.description)
            case "2A9F": CharacteristicsTable.append("User Control Point: "+thisCharacteristic.properties.rawValue.description)
            case "2A9A": CharacteristicsTable.append("User Index: "+thisCharacteristic.properties.rawValue.description)
            case "2A76": CharacteristicsTable.append("UV Index: "+thisCharacteristic.properties.rawValue.description)
            case "2A96": CharacteristicsTable.append("VO2 Max: "+thisCharacteristic.properties.rawValue.description)
            case "2A97": CharacteristicsTable.append("Waist Circumference: "+thisCharacteristic.properties.rawValue.description)
            case "2A98": CharacteristicsTable.append("Weight: "+thisCharacteristic.properties.rawValue.description)
            case "2A9D": CharacteristicsTable.append("Weight Measurement: "+thisCharacteristic.properties.rawValue.description)
            case "2A9E": CharacteristicsTable.append("Weight Scale Feature: "+thisCharacteristic.properties.rawValue.description)
            case "2A79": CharacteristicsTable.append("Wind Chill: "+thisCharacteristic.properties.rawValue.description)
/*
            case "2A27":
                print("Hardware Revision String")
                CharacteristicsTable.append("Hardware Revision String: "+thisCharacteristic.properties.rawValue.description)
            case "2A25":
                print("Serial Number String")
                CharacteristicsTable.append("Serial Number String: "+thisCharacteristic.properties.rawValue.description)
            case "2A26":
                print("Firmware Revision String")
                CharacteristicsTable.append("Firmware Revision String: "+thisCharacteristic.properties.rawValue.description)
            case "2A29":
                print("Manufacturer Name String")
                CharacteristicsTable.append("Manufacturer Name String: "+thisCharacteristic.properties.rawValue.description)
            case "2A24":
                print("Model Number String")
                CharacteristicsTable.append("Model Number String: "+thisCharacteristic.properties.rawValue.description)
                */
            default:
                print(thisCharacteristic.uuid.uuidString)
                print(thisCharacteristic.properties.rawValue.description)
                //CharacteristicsTable.append(thisCharacteristic.uuid.uuidString)
            }
            
            if CharacteristicsTable.count > preupdateCount {
                detailTable.reloadData()
            }
            
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
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let value = characteristic.value {
            debugPrint("peripheral didUpdateValueFor", peripheral.name ?? "-", value, error ?? "-")
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.CharacteristicsTable.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"cell")
        
        let str = CharacteristicsTable[indexPath.row]
        cell.textLabel?.text = CharacteristicsTable[indexPath.row]
        
        return cell
    }
}
