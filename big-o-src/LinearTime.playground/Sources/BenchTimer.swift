/*:
 # Introduction to Algorithms in Swift
 ## Source Code
 
 I’m offering lifetime access to the course for 75% off.
 Be sure to take advantage of this discount while it lasts!
 
 [**Here is where you can get your 75% off discount**](https://www.udemy.com/introduction-to-algorithms-in-swift/?couponCode=BESTPRICE)
 _ _ _
 */
//: Benchmark Utility
import QuartzCore

public class BenchTimer {
    public static func measureBlock(closure:() -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}

/*
 Displays formatted time
 This property provides a concise string representation of the time interval value which also includes the right unit of time, which ranges from ns to s.
 */
public extension CFTimeInterval {
    public var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gµs", self * 1e6)
            : self < 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}
