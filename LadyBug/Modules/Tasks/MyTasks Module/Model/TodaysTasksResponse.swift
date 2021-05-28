//
//  TodaysTasksResponse.swift
//  LadyBug
//
//  Created by SAMEH on 28/05/2021.
//

import Foundation

// MARK: - TodaysTasksResponse
struct TodaysTasksResponse: Codable {
    var success: Bool?
    var data: TodaysTasksResponseDetails?
    var message: String?
    var code: Int?
}

// MARK: - DataClass
struct TodaysTasksResponseDetails: Codable {
    var weatherData: WeatherData?
    var tasks: [TaskDetails]?

    enum CodingKeys: String, CodingKey {
        case weatherData = "weather_data"
        case tasks
    }
}

// MARK: - Task
struct TaskDetails: Codable {
    var farmedTypeName: String?
    var todayTasks: [TodayTask]?

    enum CodingKeys: String, CodingKey {
        case farmedTypeName = "farmed_type_name"
        case todayTasks = "today_tasks"
    }
}

// MARK: - TodayTask
struct TodayTask: Codable {
    var id: Int?
    var name: String?
    var farmID, serviceTableID, taskTypeID: Int?
    var taskTypeName: String?
    var quantity, quantityUnitID: Int?
    var startAt, notifyAt, dueAt: String?
    var done: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case farmID = "farm_id"
        case serviceTableID = "service_table_id"
        case taskTypeID = "task_type_id"
        case taskTypeName = "task_type_name"
        case quantity
        case quantityUnitID = "quantity_unit_id"
        case startAt = "start_at"
        case notifyAt = "notify_at"
        case dueAt = "due_at"
        case done
    }
}


