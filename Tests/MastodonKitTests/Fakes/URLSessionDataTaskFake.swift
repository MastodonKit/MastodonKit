import Foundation

class URLSessionDataTaskFake: URLSessionDataTask {
    var didCallResume = false

    override func resume() {
        didCallResume = true
    }
}
