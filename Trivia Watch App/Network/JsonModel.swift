import Foundation

// MARK: - Welcome
struct ResponseModel: Codable {
    let responseCode: Int?
    let results: [Response]?

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct Response: Codable {
    let category: String?
    let type: TypeEnum?
    let difficulty: Difficulty?
    let question, correctAnswer: String?
    let incorrectAnswers: [String]?

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case multiple = "multiple"
    case tf = "boolean"
}
