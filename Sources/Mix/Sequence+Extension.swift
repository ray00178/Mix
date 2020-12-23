//
//  Sequence+Extension.swift
//  
//
//  Created by Ray on 2020/11/27.
//

public extension Sequence where Iterator.Element: Hashable {
    
    /// 排除重複的值
    /// ```
    /// How to use it ?
    /// let array: [Int] = [1, 1, 1, 1, 2, 3, 3, 4, 4, 4, 5, 6, 6, 7, 7]
    /// array.unique()
    /// print = [1, 2, 3, 4, 5, 6, 7]
    /// ```
    func unique() -> [Iterator.Element] {
        var set: Set<Iterator.Element> = Set()
        return filter { set.insert($0).inserted }
    }
}
