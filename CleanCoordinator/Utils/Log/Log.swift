//
//  Log.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import Foundation

final class Log {
    enum Level: String {
        case verbose = "🔎 VERBOSE"
        case debug = "✨ DEBUG"
        case info = "ℹ️ INFO"
        case warning = "⚠️ WARNING"
        case error = "🚨 ERROR"
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    private static func log(_ message: Any, level: Level, fileName: String, line: Int, funcName: String) {
        let timestamp = dateFormatter.string(from: Date())
        let logMessage = "\(message)"
        let head = level.rawValue
        let file = fileName.components(separatedBy: "/").last ?? "UnknownFile"
        
        print("\(timestamp) [\(head)] [\(file):\(line) \(funcName)] - \(logMessage)")
    }
    
}

extension Log {
#if DEBUG
    static func verbose(_ message: Any, fileName: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .verbose, fileName: fileName, line: line, funcName: funcName)
    }
    
    static func debug(_ message: Any, fileName: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .debug, fileName: fileName, line: line, funcName: funcName)
    }
    
    static func info(_ message: Any, fileName: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .info, fileName: fileName, line: line, funcName: funcName)
    }
    
    static func warning(_ message: Any, fileName: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .warning, fileName: fileName, line: line, funcName: funcName)
    }
    
    static func error(_ message: Any, fileName: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .error, fileName: fileName, line: line, funcName: funcName)
    }
#endif
}
