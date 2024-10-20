import Foundation

func getResponseText(from responseString: String) -> [String] {
    guard let jsonData = responseString.data(using: .utf8) else {
        print("Error parsing JSON: ")
        return []
    }
    do {

        let jsonObject =
            try JSONSerialization.jsonObject(with: jsonData, options: [])
            as? [String: Any]

        // Navigate through the structure to find the text responses
        var texts: [String] = []

        if let dataDict = jsonObject?["data"] as? [String: Any],
            let resultDict = dataDict["result"] as? [String: Any],
            let responseArray = resultDict["response"] as? [[String: Any]]
        {
            for response in responseArray {
                if let textDict = response["text"] as? [String: Any],
                    let textArray = textDict["text"] as? [String]
                {
                    texts.append(contentsOf: textArray)
                }
            }
        }

        return texts

    } catch {
        print("Error parsing JSON: \(error)")
        return []
    }
}
