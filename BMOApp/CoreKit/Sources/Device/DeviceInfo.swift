//
//  DeviceInfo.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import UIKit

public struct DeviceInfo {

    public static var model: String {
        UIDevice.current.model
    }

    public static var osVersion: String {
        UIDevice.current.systemVersion
    }

    public static var deviceId: String {
        UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
    }
}

