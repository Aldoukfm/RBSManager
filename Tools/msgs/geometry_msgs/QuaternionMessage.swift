//
//  QuaternionMessage.swift
//
//  Created by wesgoodhoofd on 2019-01-22.
//

import UIKit
import ObjectMapper

public class QuaternionMessage: RBSMessage {
	public var x: float64 = 0
	public var y: float64 = 0
	public var z: float64 = 0
	public var w: float64 = 0
    

    public override func mapping(map: Map) {
	    x <- map["x"]
		y <- map["y"]
		z <- map["z"]
		w <- map["w"]
    }
}
