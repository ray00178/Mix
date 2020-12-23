//
//  String+Extension.swift
//  
//
//  Created by Ray on 2020/11/27.
//

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
    
    /// 擷取字串
    /// ```
    /// let demo = "0123456789"
    ///
    /// demo.substring(from: 0, to: 3)
    /// print = "0123"
    ///
    /// demo.substring(from: 4, to: 7)
    /// print = "4567"
    ///
    /// demo.substring(from: 1, to: 1)
    /// print = "1"
    /// ```
    /// - Parameters:
    ///   - from: 起始位置，必須大於0
    ///   - to: 結束位置，必須大於或等於起始位置，並小於字串長度
    /// - Returns: substring
    func substring(from: Int, to: Int) -> String {
        let length = self.count
        
        if from < 0 || to >= length || from > to { return self }
        
        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: to)
        
        return String(self[start...end])
    }
    
    /// 檢查某個位置的字串是否相等某字串
    /// - Parameters:
    ///   - element: 檢查字串
    ///   - index: 位置
    /// - Returns: If true means equal, otherwise false
    func checkEqual(_ element: String, on index: Int) -> Bool {
        let length = self.count
        
        if index < 0 || index >= length { return false }
        
        let start = self.index(self.startIndex, offsetBy: index)
        let end = self.index(self.startIndex, offsetBy: index)
        
        return String(self[start...end]).contains(element)
    }
}
