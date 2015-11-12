import Foundation

public class CacheObject<T: AnyObject>: NSObject, NSCoding {

  public let value: T
  public let expirationDate: NSDate

  init(value: T, expirationDate: NSDate) {
    self.value = value
    self.expirationDate = expirationDate
  }

  func isExpired() -> Bool {
    return expirationDate.timeIntervalSinceNow < 0
  }

  // MARK: - NSCoding

  public required init?(coder aDecoder: NSCoder) {
    value = aDecoder.decodeObjectForKey("value") as! T
    expirationDate = aDecoder.decodeObjectForKey("expirationDate") as! NSDate

    super.init()
  }

  public func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(value, forKey: "value")
    aCoder.encodeObject(expirationDate, forKey: "expiryDate")
  }
}
