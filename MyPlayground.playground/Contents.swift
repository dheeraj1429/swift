import Foundation
import SwiftUI

//let names = ["Anna", "Alex", "Brian", "Jack"]
//
//for name in names {
//    print("Name \(name)")
//}

//let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//for (animalName, animalCount) in numberOfLegs {
//    print("\(animalName)s have \(animalCount) legs")
//}

//for index in 1...5 {
//    print("Index \(index)")
//}

//let power = 10
//var answer = 1
//let base = 3
//
//for _ in 1...power {
//    answer *= base
//}
//print("answer \(answer)")

//var i = 1
//
//repeat {
//    if i == 10 {
//        break
//    }
//
//    print("Count \(i)")
//    i += 1
//} while i < 20

//var i = 1
//
//repeat {
//    if i > 3 {
//        continue
//    }
//    print("Count \(i)")
//    i += 1
//} while i < 10

//var i = 10

//switch i {
//case 5:
//    print("Count is 5")
//    fallthrough
//case 10:
//    print("Count is 10")
//    fallthrough
//default:
//    print("Non of the option match")
//}

//switch i {
//case 5:
//    print("Count is 5")
//    fallthrough
//case 10:
//    print("Count is 10")
//    break
//default:
//    print("Non of the option match")
//}

//func sum(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//print("Sum of 10 and 20 is \(sum(a: 10, b: 20))")

//enum errorexp: LocalizedError {
//    case notAValidAge
//
//    var errorDescription: String? {
//        switch self {
//        case .notAValidAge:
//            return "NOT A VALID AGE"
//        }
//    }
//}
//
//func checkValidAge(age: Int) throws{
//    guard age > 0 else {
//        throw errorexp.notAValidAge
//    }
//    print("Your provided valid age number \(age)")
//}
//
//do {
//   try checkValidAge(age: -1)
//}catch {
//    print("ERROR: \(error.localizedDescription)")
//}

//var i = 2
//
//while i <= 10 {
//    print("Index \(i)")
//    guard i % 2 == 0 else {
//        i += 1;
//        continue
//    }
//    print("Count \(i)")
//    i += 1
//}

//func checkOddEven(number: Int) {
//    guard number % 2 == 0 else {
//        print("Odd numnber")
//        return
//    }
//
//    print("Even number")
//}
//
//checkOddEven(number: 3)

//func checkJobEligibility(age: Int) {
//    guard age > 20, age < 30 else {
//        print("You're not allow for this job")
//        return
//    }
//
//    print("You're allow for this job")
//}
//
//checkJobEligibility(age: 40)

//func checkAge() {
//    var age: Int? = 20
//
//    guard let myAge = age else {
//        print("Age is undifined")
//        return
//    }
//
//    print("My age \(myAge)")
//}
//
//checkAge()

//var number: [Int] = [1,2,3,4]
//print(number)

//var values = [Int]()
//print(values)

//var languages = ["Swift", "Java", "C++"]
//// access element at index 0
//print(languages[0])   // Swift
//// access element at index 2
//print(languages[2])   // C++

//var numbOne = [1,2,3]
//var numbTwo = [4,5,6]
//
//numbOne.append(contentsOf: numbTwo)
//print(numbOne)

//var numbers = [21, 34, 54, 12]
//numbers.insert(10, at: 3)
//print(numbers)

//var numbers: [Int] = [10, 20]
//numbers[1] = 40
//print(numbers[1])

//var languages = ["Swift","Java","Python"]
//languages.remove(at: 0)
//print(languages)

//var numbers = [21, 34, 54, 12, 10]
//numbers.sort()
//print(numbers)
//numbers.sort(by: <)
//print(numbers)

//numbers.swapAt(1, 3)
//print(numbers)

//numbers.reverse()
//print(numbers)

//numbers.forEach { number in
//    print(number)
//}

//if numbers.contains(10) {
//    print("10 is aviable in numnbers array")
//}

//print(numbers.contains {$0 > 20})

//struct User: Identifiable {
//    var id: String
//    var name: String
//}
//
//var userOne = User(id: "1", name: "Emir")
//var userTwo = User(id: "2", name: "Emirhan")
//
//var users: [User] = [userOne, userTwo]
//
//print(users.contains { $0.id == userOne.id })

//let numbers = [10, 20, 30, 40]
//if let result = numbers.first(where: {$0 == 30}) {
//    print("result \(result)")
//}

//let filteredArray = numbers.filter {$0 > 20}
//print(filteredArray)

//let names = ["Amit", "Karan", "Aman"]
//let filteredArray = names.filter {$0.hasPrefix("A")}
//print(filteredArray)

//struct User {
//    var name: String
//}
//
//let userOne = User(name: "Emir")
//let userTwo = User(name: "Emirhan")
//
//let users: [User] = [userOne, userTwo]
//
//let fillerdUsers = users.filter { $0.name.hasSuffix("an") }
//
//for user in fillerdUsers {
//    print(user.name)
//}

//let numbers = [1, 5, 10, 20, 30]
//
//let result = numbers.filter { $0 > 5 && $0 < 30 }
//print(result)

//let numbers = [10, 20, 30, 40]

//let result = numbers.enumerated().filter { index, value in
//        index == 2
//}
//print(result)

//struct User {
//    var name: String
//}
//
//let userOne = User(name: "Karan")
//let userTwo = User(name: "Eran")
//let userThree = User(name: "Emirhan")
//
//let users: [User] = [userOne, userTwo, userThree]
//
//let results = users.filter { $0.name.hasPrefix("E") }.sorted {
//    $0.name > $1.name
//}
//
//print(results)

//struct User: Identifiable {
//    var id: String
//}
//
//let userOne = User(id: "1")
//let userTwo = User(id: "2")
//let userThree = User(id: "3")
//let userFour = User(id: "4")
//let userFive = User(id: "5")
//let userSix = User(id: "6")
//
//let users = [userOne, userTwo, userThree, userFour, userFive, userSix]
//
////let results = users.filter { Int($0.id)! > 3 }
////print(results)
//
//let results = users.filter { user in
////    if let intUserId = Int(user.id) {
////        return intUserId > 3
////    }
////    return false
//
//    guard let intUserId = Int(user.id) else {
//        return false
//    }
//
//    return intUserId > 3
//}
//
//print(results)

//struct User: Identifiable {
//    var id: String
//    var name: String
//}
//
//struct UserWithMetaData: Identifiable {
//    var id: String
//    var name: String
//    var isSelected: Bool
//}
//
//let userOne = User(id: "1", name: "Karan")
//let userTwo = User(id: "2", name: "Eran")
//
//let users = [userOne, userTwo]
//
//let results: [UserWithMetaData] = users.map { user in
//    UserWithMetaData(id: user.id, name: user.name, isSelected: user.id == "1")
//}
//
//print(results)

//protocol User {
//    var id: String { get set }
//    var name: String { get set }
//}
//
//protocol SubUser: User {
//    var isSelected: Bool? { get set }
//}
//
//struct UserData: SubUser {
//    var id: String
//    var name: String
//    var isSelected: Bool?
//}
//
//let userOne = UserData(id: "1", name: "Dheeraj")
//let userTwo = UserData(id: "2", name: "Karan")
//
//let results = [userOne, userTwo].map { user in
//    UserData(id: user.id, name: user.name, isSelected: user.id == "1")
//}
//
//print(results)

//var numbers: Set<Int> = [1,3,4,2]
//numbers.insert(10)
//print(numbers)
//numbers.removeFirst()
//print(numbers)
//numbers.removeAll()
//print(numbers)
//print("\(numbers.randomElement() ?? -1)")
//print(numbers.contains(10))
//for number in numbers {
//    print(number)
//}
//let findNumber = numbers.first { $0 == 3 }
//print(findNumber ?? -1)

//var a: Set = [1,2,3]
//var b: Set = [3,4,5]
//
//let union = a.union(b)
//print(union)
//
//let intersection = a.intersection(b)
//print(intersection)
//
//let symmetricDifference = a.symmetricDifference(b)
//print(symmetricDifference)

//var a: Set = [1,2,3]
//var b: Set = [2,3]

//print(b.isSubset(of: a))

//var emptySet = Set<Int>()

//var product = ("MacBook", 1099.99)
//print(product.0)
//print(product.1)
//product.0 = "MacBookPro"
//print(product)

//var alphabets = ("A", "B", "C", ("a", "b", "c"))
//print(alphabets.3.0)

//print(sqrt(20))
//print(pow(10, 5))

//func greetMessage() {
//    let message: String = "Hello"
//
//    func greet() {
//        print("\(message) Dheeraj")
//    }
//
//    greet()
//}
//greetMessage()

//func greetMessage() -> () -> Void {
//    let message: String = "Hello"
//
//    func greet() {
//        print("\(message) Dheeraj")
//    }
//
//    return greet
//}
//
//greetMessage()()

//for i in 1...5 {
//    print(i)
//}

//for i in (1...5).reversed() {
//    print(i)
//}

//for i in 1..<5 {
//    print(i)
//}

//let languages = ["Swift", "Java", "C", "Java script", "PHP"]
//let newArr = languages[0...2]
//print(languages, newArr)

//let greeting = { (name: String) in
//    print("Hello \(name)")
//}
//
//greeting("Dheeraj")

//let sum = {(num: Int) -> Int in
//    return num*2
//}
//print(sum(10))

//func search(a: () -> Void) {
//    a()
//}
//
//search {
//    print("Hello world!")
//}

//func grabLunch(message: String = "Let's go out for lunch", search: () -> Void) {
//    print(message)
//    search()
//}
//grabLunch {
//    print("This is the search function")
//}

//func grabLunch(message: String = "Let's go out for lunch", search: (() -> Void)? = nil) {
//    print(message)
//
//    if let searchFunction = search {
//        searchFunction()
//    }
//}
//
//func searchFn() {
//    print("Search function code")
//}

//grabLunch(message: "New string") {
//    print("Search function code")
//}

//grabLunch(message: "New string", search: searchFn)

//func fetchUsername(completion: (String) -> Void) {
//    print("Fetching data...")
//
//    let demoUser = "demo_user_1"
//
//    completion(demoUser)
//}
//
//fetchUsername { userName in
//    print("User name \(userName)")
//}

//func saveData(onComplete: (Bool, String) -> Void) {
//    print("Saving data...")
//
//    let isCompleted = false
//    let message = "Fail to save the data"
//
//    onComplete(isCompleted, message)
//}
//
//saveData { isCompleted, message in
//    print(isCompleted, message)
//}

//func saveData(onComplete: (Bool?, String?) -> Void) {
//    print("Saving data...")
//
//    let isCompleted = false
//    let message = "Fail to save the data"
//
//    onComplete(isCompleted, message)
//}
//
//saveData { isCompleted, message in
//    print(isCompleted!, message!)
//}

//class Bike {
//    var name: String = ""
//    var gare: Int = 0
//
//    init(name: String, gare: Int) {
//        self.name = name
//        self.gare = gare
//    }
//}

//let bike1 = Bike(name: "Bike1", gare: 1)
//print(bike1)
//bike1.name = "bike1"
//bike1.name = 2
//bike1.gare = 2
//print(bike1)

//class Room {
//
//    var length = 0.0
//    var breadth = 0.0
//
//    init(length: Double = 0.0, breadth: Double = 0.0) {
//        self.length = length
//        self.breadth = breadth
//    }
//
//    func calculateArea() {
//        print("Area of Room =", length * breadth)
//    }
//}
//
//var studyRoom = Room(length: 42.0, breadth: 30.8)
//studyRoom.calculateArea()

//class Bike {
//    var color: String
//
//    init(color: String) {
//        self.color = color
//    }
//}

//struct Bike {
//    var color: String
//
//    init(color: String) {
//        self.color = color
//    }
//}
//
//
//var bike1 = Bike(color: "red")
//var bike2 = bike1
//bike1.color = "green"
//print(bike1.color, bike2.color)

//class Rectangle {
//    var weight: Double = 0.0
//    var height: Double = 0.0
//
//    var ara: Double {
//        get {
//            return weight * height
//        }
//
//        set(newArea) {
//            weight = newArea / height
//        }
//    }
//}
//
//let rect = Rectangle()
//rect.weight = 10.5
//rect.height = 5.0
//print(rect.ara)
//rect.ara = 100.0
//print(rect.weight)

//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    var fullName: String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//
//        set(fullName) {
//            let nameComponents = fullName.split(separator: " ")
//            if(nameComponents.count > 0) {
//                firstName = String(nameComponents.first!)
//                lastName = String(nameComponents.last!)
//            }
//        }
//    }
//}
//
//let p1 = Person(firstName: "Dheeraj", lastName: "Rawat")
//print(p1.fullName)
//
//p1.fullName = "Karan Sharma"
//print(p1.fullName)

//class Hall {
//    var length: Double = 0.0
//    var breadth: Double = 0.0
//    var hegith: Double = 0.0
//
//    func calculateArea() -> Double {
//        return length * breadth
//    }
//
//    func calculateVolumne() -> Double {
//        return calculateArea() * hegith
//    }
//}
//
//let hall1 = Hall()
//hall1.length = 10.0
//hall1.breadth = 5.0
//hall1.hegith = 3.0
//print(hall1.calculateArea())
//print(hall1.calculateVolumne())

//class Calculator {
//    static func add(_ a: Int, _ b: Int) -> Int {
//        return a + b
//    }
//}
//
//print(Calculator.add(10, 20))

//class User {
//    var age: Int
//
//    init(age: Int) {
//        self.age = age
//    }
//
//    func newAge(age: Int) {
//        if(self.age < age) {
//            self.age = age
//        }
//    }
//}
//
//let u1 = User(age: 20)
//u1.newAge(age: 30)
//print(u1.age)

//class Race {
//    var loop: Int
//
//    init(loop: Int) {
//        self.loop = loop
//    }
//
//    deinit {
//        print("Memory Deallocated")
//    }
//}
//
//var race1: Race? = Race(loop: 5)
//print(race1)
//race1 = nil

//class Animal {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func getInfo() {
//        print("Name \(name) age \(age)")
//    }
//
//    func printInfo() {
//        print("Hello from the Animal class")
//    }
//}
//
//class Dog: Animal {
//    var bread: String
//
//    init(name: String, age: Int, bread: String) {
//        self.bread = bread
//        super.init(name: name, age: age)
//    }
//
//    override func getInfo() {
//        print("Dog name \(name), Dog age \(age) and the dog bread \(bread)")
//    }
//
//    func printInfo(extraInfo: String) {
//        print("Hello from the Dog class with extra info \(extraInfo)")
//    }
//}
//
//let dog1 = Dog(name: "Ro", age: 10, bread: "Haski")
//dog1.getInfo()
//dog1.printInfo(extraInfo: "abcasd")

//var firstUserName: String = "Dheeraj"
//var secondUserName: String? = nil
//
//print(firstUserName, secondUserName)
////firstUserName = nil
//secondUserName = "Karan"
//print(firstUserName, secondUserName)
//secondUserName = nil

//func printLog() {
//    var name: String? = "Dheeraj"
//    if let userName = name {
//        print(userName)
//    }
//}
//
//printLog()

//print(Array(repeating: 1, count: 5))

//var array = [1,2,3]
//array += [4,5,6]
//print(array)
//array.append(contentsOf: [7,8,9])
//print(array)

//var arr = ["Karan", "Aman", "Rohan", "Aman", "Anil"]
//arr.remove(at: arr.firstIndex(of: "Aman")!)
////print(arr)
//
//var arr2 = ["Aman", "Anil"]
//
//for item in arr2 {
//    arr.remove(at: arr.firstIndex(of: item)!)
//}
//
//print(arr)

//arr.removeAll { element in
//    arr2.contains(element)
//}
//print(arr)

//var animals = ["lion", "zebra", "chimp", "elephant"]
//print(animals)
//animals.append("panda")
//print(animals)
//animals.remove(at: animals.firstIndex(of: "lion") ?? -1)
//print(animals)
//print(animals.contains("elephant") && animals.contains("giraffes"))

//struct TvShow: Codable, Identifiable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIds: [Int]
//    let id: Int
//    let originCountry: [String]
//    let originalLanguage: String
//    let originalName: String
//    let overview: String
//    let popularity: Double
//    let posterPath: String
//    let firstAirDate: Date
//    let name: String
//    let voteAverage: Double
//    let voteCount: Int
//}
//
//struct TvShows: Codable {
//    let page: Int
//    let results: [TvShow]
//    let totalPages: Int
//    let totalResults: Int
//}
//
//enum ApiError: LocalizedError {
//    case invalidUrl
//    // Capture the specific status code (e.g., 404, 500)
//    case serverError(statusCode: Int)
//    // Wrap the underlying transport/network error (e.g., no internet, timeout)
//    case transportError(Error)
//    // Wrap the specific decoding error (e.g., key missing, type mismatch)
//    case decodeFail(Error)
//
//    var errorDescription: String? {
//        switch self {
//        case .invalidUrl:
//            return "The provided URL was invalid."
//        case .serverError(let code):
//            return "Server responded with status code: \(code)."
//        case .transportError(let error):
//            return "Network connection failed: \(error.localizedDescription)"
//        case .decodeFail(_):
//            return "Failed to parse data from server."
//        }
//    }
//}
//
//let apiKey = "314e0eb364154825e10072833dc9c184"
//
//func fetchTvShowes() async throws -> TvShows {
//    guard let url = URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=\(apiKey)") else {
//        throw ApiError.invalidUrl
//    }
//
//    let request = URLRequest(url: url)
//
//    var (data, response): (Data, URLResponse)
//
//    do {
//        (data, response) = try await URLSession.shared.data(for: request)
//    } catch {
//        throw ApiError.transportError(error)
//    }
//
//    guard let httpResponse = response as? HTTPURLResponse else {
//        throw ApiError.serverError(statusCode: -1)
//    }
//
//    guard (200...299).contains(httpResponse.statusCode) else {
//        throw ApiError.serverError(statusCode: httpResponse.statusCode)
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return try decoder.decode(TvShows.self, from: data)
//    }catch {
//        throw ApiError.decodeFail(error)
//    }
//}
//
//func callFetchTvShows() async {
//    do {
//        let tvShows = try await fetchTvShowes()
//        print("Fetched \(tvShows.results) TV shows.")
//    } catch {
//        print("Failed to fetch TV shows: \(error)")
//    }
//}

//enum Api {
//    case searchPosts(query: String, page: Int)
//    case updatePost(id: Int, userId: Int)
//    case getPost
//}
//
//extension Api {
//    var path: String {
//        switch self {
//        case .searchPosts:
//            return "/posts"
//        case .updatePost:
//            return "/update/post"
//        case .getPost:
//            return "/posts"
//        }
//    }
//
//    var queryItems: [URLQueryItem]? {
//        switch self {
//        case .searchPosts(let query, let page):
//            return [
//                URLQueryItem(name: "q", value: query),
//                URLQueryItem(name: "page", value: "\(page)"),
//            ]
//        case .updatePost(let id, let userId):
//            return [
//                URLQueryItem(name: "id", value: "\(id)"),
//                URLQueryItem(name: "userId", value: "\(userId)"),
//            ]
//        default:
//            return nil
//        }
//    }
//
//    var headers: [String: String]? {
//        switch self {
//        case .getPost, .searchPosts:
//            return ["Accept": "application/json"]
//        case .updatePost:
//            return [
//                "Authorization": "Bearer ABC",
//                "Content-Type": "application/json",
//            ]
//        }
//    }
//
//    var method: String {
//        switch self {
//        case .getPost, .searchPosts:
//            return "GET"
//        case .updatePost:
//            return "PUT"
//        }
//    }
//}
//
//func buildRequest(endpoint: Api, baseUrl: String) -> URLRequest? {
//    guard var url = URL(string: baseUrl + endpoint.path) else { return nil }
//
//    if let queryItems = endpoint.queryItems {
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//        components?.queryItems = queryItems
//        guard let finalUrl = components?.url else { return nil }
//        url = finalUrl
//    }
//
//    var reqeust = URLRequest(url: url)
//    reqeust.httpMethod = endpoint.method
//
//    if let apiHeaders = endpoint.headers {
//        apiHeaders.forEach { (key, value) in
//            reqeust.setValue(value, forHTTPHeaderField: key)
//        }
//    }
//
//    return reqeust
//}
//
//let reqeust = buildRequest(endpoint: .searchPosts(query: "new movies", page: 10), baseUrl: "http://localhost:3000")

//enum PizzaSize: Int, CaseIterable {
//    case small = 10, large = 20, medium = 30
//}
//
//for currentSize in PizzaSize.allCases {
//    print(currentSize.rawValue)
//}

//var colors = Set<String>()
//print(colors)
//colors.insert("Red")
//colors.insert("Blue")
//colors.insert("Green")
//print(colors)
//colors.remove("Blue")
//print(colors)

//let colors: Set<String> = ["red", "green", "blue"]
//print(colors.isEmpty)
//print(colors.contains("red"))
//print(colors.contains("blueee"))
//let sortedColors = colors.sorted()
//print(sortedColors)
//print(type(of: sortedColors))
//print(type(of: colors))
//print(colors.min()!)
//print(colors.max()!)

