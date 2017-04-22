import Foundation

class URLSessionFake: URLSession {
    var lastRequest: URLRequest?
    var lastCompletionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var lastReturnedDataTask: URLSessionDataTaskFake?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastRequest = request
        lastCompletionHandler = completionHandler
        lastReturnedDataTask = URLSessionDataTaskFake()

        return lastReturnedDataTask!
    }
}
