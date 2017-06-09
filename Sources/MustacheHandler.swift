//
//  MustacheHandler.swift
//
//  Created by doublej on 2017/3/9.
//  Copyright © 2017年 doublej. All rights reserved.
//

import PerfectLib
import PerfectHTTP
//import PerfectMustache
var responsePath:String = ""

struct UploadHandler: MustachePageHandler { // all template handlers must inherit from PageHandler
    
	func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
		#if DEBUG
			print("[\(#line)]->UploadHandler got request")
		#endif
		var values = MustacheEvaluationContext.MapType()
		// Grab the WebRequest so we can get information about what was uploaded
		let request = contxt.webRequest
		// 创建接收图片的存储目录 这里是double-j·测试
		let fileDir = Dir(Dir.workingDir.path + "files/double-j·测试")
		do {
			try fileDir.create()
		} catch {
			print("[\(#line)]->\(error)")
		}
		
		if let uploads = request.postFileUploads, uploads.count > 0 {
			
			var ary = [[String:Any]]()

			for upload in uploads {
				ary.append([
					"fieldName": upload.fieldName,
					"contentType": upload.contentType,
					"fileName": upload.fileName,
					"fileSize": upload.fileSize,
					"tmpFileName": upload.tmpFileName
					])

				// move file to webroot
				let thisFile = File(upload.tmpFileName)
				do {
                    print("[\(#line)]->path==\(fileDir.path + upload.fileName) ")
//                    LogFile.debug("LogFilerequestCompleted==path==\(fileDir.path + upload.fileName) ")
//                    LogFile.info("LogFilerequestCompleted==path==\(fileDir.path + upload.fileName) ")
//                    LogFile.warning("LogFilerequestCompleted==path==\(fileDir.path + upload.fileName) ")
//                    LogFile.critical("LogFilerequestCompleted==path==\(fileDir.path + upload.fileName) ")
				} catch {
					print("[\(#line)]->\(error)")
				}
                do {
                    let docRoot = "\(fileDir.path + upload.fileName)"
                    let _ = try thisFile.moveTo(path: docRoot  , overWrite: true)
                    responsePath = "\( Requestyjj + ":8888/img/" + upload.fileName)"
//                    print("[\(#line)]->path==\(fileDir.path + upload.fileName)==docRoot==\(docRoot)==\(responsePath)")
                } catch {
                    print("[\(#line)]->\(error)")
                }
			}
			values["files"] = ary
			values["count"] = ary.count
		}

		// Grab the regular form parameters
		let params = request.params()
		if params.count > 0 {
			// Create an array of dictionaries which will show what was posted
			// This will not include any uploaded files. Those are handled above.
			var ary = [[String:Any]]()

			for (name, value) in params {
				ary.append([
					"paramName":name,
					"paramValue":value
					])
			}
			values["params"] = ary
			values["paramsCount"] = ary.count
		}

        let RequestResultSuccess: String = "SUCCESS"
        let RequestResultFaile: String = "FAILE"
        let ResultListKey = "list"
        let ResultKey = "result"
        let ErrorMessageKey = "errorMessage"
        var BaseResponseJson: [String : Any] = [ResultListKey:[], ResultKey:RequestResultSuccess, ErrorMessageKey:""]
        var responseJson: [String : Any] = BaseResponseJson
        
        var dic = [String:String]()
        dic["content"] = responsePath
        responseJson[ResultListKey] = dic
        
        guard let josn = try? responseJson.jsonEncodedString() else {
            return
        }
        
		values["title"] = "Upload Enumerator"
		contxt.extendValues(with: values)
		do {
//上传成功
            print("[\(#line)]->requestCompleted==\(josn )")
            let response = contxt.webResponse
            response.status = .ok
            response.appendBody(string: "\(josn )")
            response.completed()

		} catch {
            print("[\(#line)]->response.completed()==\(error)")
//			let response = contxt.webResponse
//			response.status = .internalServerError
//			response.appendBody(string: "\(error)")
//			response.completed()
		}
	}
}
