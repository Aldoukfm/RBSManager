//
//  NavSatFixMessage.swift
//  ObjectMapper
//
//  Created by Wes Goodhoofd on 2019-07-13.
//

import UIKit
import ObjectMapper

public enum PositionCovarianceType: UInt8 {
    case COVARIANCE_TYPE_UNKNOWN = 0
    case COVARIANCE_TYPE_APPROXIMATED = 1
    case COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
    case COVARIANCE_TYPE_KNOWN = 3
}

public class NavSatFixMessage: RBSMessage {
    public var header: HeaderMessage?
    public var status: NavSatStatusMessage?
    public var latitude: Float64 = 0
    public var longitude: Float64 = 0
    public var altitude: Float64 = 0
    public var position_covariance: [Float64]?
    public var position_covariance_type: PositionCovarianceType?
    
    public override init() {
        super.init()
        header = HeaderMessage()
        status = NavSatStatusMessage()
    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        header <- map["header"]
        status <- map["status"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        altitude <- map["altitude"]
        position_covariance <- map["position_covariance"]
        position_covariance_type <- map["position_covariance_type"]
    }
    
    public func latitudeLabel() -> String? {
        let quadrant = (latitude > 0) ? "N" : "S"
        return String(format: "%.4f %@", latitude, quadrant)
    }

    public func longitudeLabel() -> String? {
        let quadrant = (longitude > 0) ? "E" : "W"
        return String(format: "%.4f %@", longitude, quadrant)
    }
}
