// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import Foundation

public func randomInt(_ low: Int, _ high: Int) -> Int {
	let diff = high - low + 1
	return Int(arc4random_uniform(UInt32(diff))) + low
}

func randomString(_ strings: [String]) -> String {
    if strings.isEmpty {
        return ""
    }
    let i = randomInt(0, strings.count - 1)
    return strings[i]
}

func randomBool() -> Bool {
    let i = randomInt(0, 1)
    return i == 0
}
