//
//  CoreDataExample.swift
//  SwfitUI
//
//  Created by DHEERAJ on 16/12/25.
//

import CoreData
import SwiftUI

struct CoreDataExample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        NavigationStack {
            VStack {
                List(students) { student in
                    Text(student.name ?? "Unknow name")
                }
            }
            .toolbar {
                Button {
                    let firstName = [
                        "Karan", "Aman", "Rohan", "Shoan", "Mohan",
                    ]
                    let lastName = ["Singh", "Raw", "Moh"]

                    let fullName =
                        "\(firstName.randomElement()!) \(lastName.randomElement()!)"
                    let student = Student(context: moc)
                    
                    student.name = fullName
                    student.id = UUID()
                    
                    try? moc.save()
                } label: {
                    Text("Add student")
                }
            }
        }
    }
}

#Preview {
    CoreDataExample()
}
