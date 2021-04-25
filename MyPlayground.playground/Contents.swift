//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Alamofire
import ObjectMapper
import Foundation

extension Request {
    
    public func debugLogger() -> Self {

        let urlString = self.request?.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)

        let method = self.request?.httpMethod ?? ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"

        var requestLog = "\n---------- OUT ---------->\n"
        requestLog += "\(method)\n"
        requestLog += "\(urlString)\n"
        requestLog += "\(path)\n"
        requestLog += "\(query)"
        requestLog += "Host: \(host)\n"
        for (key,value) in self.request?.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        if let body = self.request?.httpBody{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            requestLog += "\n\(bodyString)\n"
        }

        requestLog += "\n------------------------->\n";

        print(requestLog)
        return self
    }
}

class Group: Mappable {

    var name: String?
    var id: String?
    var groupId: String?
    var weeks: [Weeks]?
    var groupNumber: String?
    var type: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        groupId <- map["groupId"]
        weeks <- map["weeks"]
        groupNumber <- map["groupNumber"]
        type <- map["type"]
    }
}

class Weeks: Mappable {

    var weekOfSemester: Int?
    var days: [Days]?
    var weekOfYear: Int?
    var firstDayOfWeek: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        weekOfSemester <- map["weekOfSemester"]
        days <- map["days"]
        weekOfYear <- map["weekOfYear"]
        firstDayOfWeek <- map["firstDayOfWeek"]
    }
}

class Days: Mappable {

    var classes: [Classes]?
    var dayOfWeek: Int?
    var date: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        classes <- map["classes"]
        dayOfWeek <- map["dayOfWeek"]
        date <- map["date"]
    }
}

class Classes: Mappable {

    var groups: String?
    var number: Int?
    var name: String?
    var place: String?
    var rawType: String?
    var time: Time?
    var person: String?
    var type: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        groups <- map["groups"]
        number <- map["number"]
        name <- map["name"]
        place <- map["place"]
        rawType <- map["rawType"]
        time <- map["time"]
        person <- map["person"]
        type <- map["type"]
    }
}

class Time: Mappable {

    var start: String?
    var end: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        start <- map["start"]
        end <- map["end"]
    }
}

func request(url: String, completion: @escaping (_ data: Group?, _ error: Error?) -> Void)  {
//        let url = url.asURL()

}

//enum Endpoint:URLConvertible{
//    func asURL() throws -> URL {
//        <#code#>
//    }
//
//    static let baseUrlString = "https://api.kekmech.com/mpeix/schedule"
//
//    case Get(query: String)
//
//    var URLRequest: NSMutableURLRequest {
//        let (path: String, parameters: [String: AnyObject]?) = {
//            switch self {
//            case .Get(let query):
//                return ("/get", ["q": query])
//            }
//        }()
//
//        let URL = NSURL(string: Router.baseUrlString)!
//        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
//        // set header fields
//
//        let encoding = Alamofire.ParameterEncoding.URL
//        return encoding.encode(URLRequest, parameters: parameters).0
//    }
//}

//request(url: url) { (data, errr) in
//    print(data)
//}

var url =  "https://api.kekmech.com/mpeix/schedule/v1/group/ИЭС-16-17/schedule/0"
//var group = "ИЭС-165Б-17"


if let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
if let url = URL(string: urlString) {
//    print(url)
//    }
//}
    AF.request( url, method: .get)
        .validate(statusCode: 200..<300)
        .responseJSON { (respons) in
            switch respons.result {
            case .success(let data):
                if let group = Group(JSON: data as! [String : Any]){
                    print(group.name)
                }
            case .failure(let error):
                print(error)

            }
        }
    }
}



//class ids: Mappable{
//
//    var id: Int?
//
//    required init?(map: Map) {
//    }
//    init(id: Int) {
//        self.id = id
//    }
//    func mapping(map: Map) {
//        id <- map["id"]
//    }
//
//}
//
//
//
//var foo = ["1","2","3",]
//
////foo.af
//
//var body = [
//    "createdAfter": "2021-04-19T10:34:51.449Z"
//]
//
////var encoding = JSONEncoding.default
//var encoding = URLEncoding.default
//
//
//var url = "http://172.27.2.5/apiv2/booking/floors/"
////var url = "http://172.27.2.5/apiv2/booking/workplaces/"
//AF.request("\(url)", method: .get , parameters: body, encoding: encoding)
//    .debugLogger()
//    .responseJSON { (respons) in
//
//    switch respons.result {
//    case .success(let data):
//        print(data)
//    case .failure(let error):
//        print(error)
//    }
//}
