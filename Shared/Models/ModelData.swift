import Foundation
import Combine



final class ModelData: ObservableObject {
    @Published var serverAlive: Bool = false
    @Published var telemetrySet: [TelemetryGroup] = load("telemetry.json")
    private let endpoint: URL = URL(string: "ws://192.168.86.250:5559")!
    private var task: URLSessionWebSocketTask
    var indexDict: [String:(Int,Int)] = [:]
    
    init() {
        task = URLSession.shared.webSocketTask(with: endpoint)
        
        for (i, tg) in telemetrySet.enumerated() {
            for (j, tp) in tg.telemetryData.enumerated() {
                indexDict[tp.key] = (i,j)
            }
        }
    }
    
    func startTelemetryFeed() {
        task = URLSession.shared.webSocketTask(with: endpoint)
        self.task.resume()
        self.readMessage()
    }
    
    func suspendTelemetryFeed() {
        task.suspend()
    }
    
    func cancelTelemetryFeed() {
        task.cancel()
    }
    
    func readMessage() {
        
        task.receive{ result in
            
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.serverAlive = false
                }
                sleep(3)
                self.startTelemetryFeed()
            case .success(let message):
                switch message {
                case .data(let data):
                    print(data)
                case .string(let string):
                    
                    let strList: [String] = string.components(separatedBy: ":")
                    let key: String = strList[0]
                    let indices: (Int, Int) = self.indexDict[key]!
                    
                    DispatchQueue.main.async {
                        self.telemetrySet[indices.0].telemetryData[indices.1].value = strList[1]
                        self.serverAlive = true
                    }
                    
                @unknown default:
                    print("Recieved unknown data type from web socket.")
                }
                
                self.readMessage()
            }
            
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
