import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    
    router.post(UserDetails.self, at: "verify") { req, verify -> String in
        print("Loaded phone_number: \(verify.phone_number)")
        return "Loaded phone_number: \(verify.phone_number)"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    
}

struct UserDetails: Content {
    var phone_number: String
    var pin: String
}
