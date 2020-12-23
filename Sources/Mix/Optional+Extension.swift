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
