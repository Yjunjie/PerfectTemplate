


#if os(Linux)
	import SwiftGlibc
	import LinuxBridge
#else
	import Darwin
#endif

import PerfectLib
//import SwiftMoment

//public var logFileLocation = "./log.log"

struct FileLogger {
	let defaultFile = "./log.log"
	let consoleEcho = ConsoleLogger()

	fileprivate init(){}

//	func filelog(priority: String, _ args: String, _ eventid: String, _ logFile: String) {
//		let m = Moment()
//		var useFile = logFile
//		if logFile.isEmpty { useFile = defaultFile }
//		let ff = File(useFile)
//		defer { ff.close() }
//		do {
//			try ff.open(.append)
//			try ff.write(string: "\(priority) [\(eventid)] [\(m.format())] \(args)\n")
//		} catch {
//			consoleEcho.critical(message: "\(error)")
//		}
//	}

//	func debug(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.debug(message: message)
//		filelog(priority: "[DEBUG]", message, eventid, logFile)
//	}
//
//	func info(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.info(message: message)
//		filelog(priority: "[INFO]", message, eventid, logFile)
//	}
//
//	func warning(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.warning(message: message)
//		filelog(priority: "[WARNING]", message, eventid, logFile)
//	}
//
//	func error(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.error(message: message)
//		filelog(priority: "[ERROR]", message, eventid, logFile)
//	}
//
//	func critical(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.critical(message: message)
//		filelog(priority: "[CRITICAL]", message, eventid, logFile)
//	}
//
//	func terminal(message: String, _ eventid: String, _ logFile: String) {
//		consoleEcho.terminal(message: message)
//		filelog(priority: "[EMERG]", message, eventid, logFile)
//	}
}

/// Placeholder functions for logging system
public struct LogFile {
	private init(){}

	static var logger = FileLogger()
	public static var location = "./log.log"

//	@discardableResult
//	public static func debug(_ message: @autoclosure () -> String, eventid: String = UUID().string, logFile: String = location) -> String {
//		LogFile.logger.debug(message: message(), eventid, logFile)
//		return eventid
//	}
//
//	@discardableResult
//	public static func info(_ message: String, eventid: String = UUID().string, logFile: String = location) -> String {
//		LogFile.logger.info(message: message, eventid, logFile)
//		return eventid
//	}
//
//	@discardableResult
//	public static func warning(_ message: String, eventid: String = UUID().string, logFile: String = location) -> String {
//		LogFile.logger.warning(message: message, eventid, logFile)
//		return eventid
//	}
//
//	@discardableResult
//	public static func error(_ message: String, eventid: String = UUID().string, logFile: String = location) -> String {
//		LogFile.logger.error(message: message, eventid, logFile)
//		return eventid
//	}
//
//	@discardableResult
//	public static func critical(_ message: String, eventid: String = UUID().string, logFile: String = location) -> String {
//		LogFile.logger.critical(message: message, eventid, logFile)
//		return eventid
//	}
//
//	public static func terminal(_ message: String, eventid: String = UUID().string, logFile: String = location) -> Never  {
//		LogFile.logger.terminal(message: message, eventid, logFile)
//		fatalError(message)
//	}
}
