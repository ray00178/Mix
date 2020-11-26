import UIKit

public extension String {
    
    /// 字串是否不為空字串
    var isNotEmpty: Bool { !self.isEmpty }
    
    /// 將字串轉換Data
    var data: Data? {  self.data(using: .utf8) }
    
    /// 將字串轉換Dictionary<String, Any>
    var dictionary: Dictionary<String, Any>? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            return json as? Dictionary<String, Any>
        } catch let error {
            let msg = """
            🔥 Start 🔥
            \(self) convert to dictionary error：
            \(error)
            ========== End
            """
            print(msg)
            return nil
        }
    }
}

public extension Optional {
    
    /// 判斷該型別是否為nil
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
    /// 判斷該型別是否不為nil
    var isNotNil: Bool {
        switch self {
        case .none:
            return false
        case .some:
            return true
        }
    }
    
    /// 當型別為nil時，賦予預設值
    /// - Parameter value: Set default value
    ///
    /// ```
    /// Example:
    /// var int: Int? = nil
    /// int.isNilSet(0)
    /// Result: int = 0
    /// ```
    func isNilSet(_ value: Wrapped) -> Wrapped {
        return self ?? value
    }
    
}
