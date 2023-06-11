
import Foundation

 class NetworkLayer {
    static func sendRequest<T: Decodable>(to url: URL, decodingType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "NetworkLayer", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                completion(.failure(error))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let error = NSError(domain: "NetworkLayer", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP request failed"])
                completion(.failure(error))
                return
            }
                        
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }
            
        
        task.resume()
        
    }
}
