# Модель предметной области
<!-- Логическая модель, содержащая бизнес-сущности предметной области, атрибуты и связи между ними. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375782602

Используется диаграмма классов UML. Документация: https://plantuml.com/class-diagram 
-->

```plantuml
@startuml
' Логическая модель данных в варианте UML Class Diagram (альтернатива ER-диаграмме).
namespace TimeTable {

 class TimeTable
 {
  id : string
  events : Conference[]
 }

 class Conference
 {
  type : CartItemPrice
  startDate: Date
  conferenceManager: ConferenceManager
  speakers : Speaker
  offlineAttendants: OfflineAttendant[]
  onlineAttendants: OnlineAttendant[]
 }

 class ConferenceManager
 {
  name : String
  position : String 
 }

 class Speaker
 {
  name : String
  city : String
  company : String
  topic : String
  approved : boolean  
 }

 class OfflineAttendant {
  name : String
  city : String
  company : String
  invitationId : String
 }

 class OnlineAttendant
 {
  name : String
  city : String
  company : String
  invitationLink: String
 }
 
 TimeTable *-- "1..*" Conference
 Conference *-- "1..1" ConferenceManager
 Conference *-- "1..*" Speaker
 Conference *-- "0..*" OfflineAttendant
 Conference *-- "0..*" OnlineAttendant
}

namespace RunningConference {
  class DaySchedule {
    speeches : Speech[]
    specialGuests: OfflineAttendant[]
    conferenceManager: ConferenceManager 
  }

  class Speech {
    speaker: Speaker
    topic: String
    startAt: Time
  }

  DaySchedule *-- "1..**" Speech
  DaySchedule *-- "1..**" OfflineAttendant
  DaySchedule *-- "1..1" ConferenceManager
  Speech *-- "1..1" Speaker
}

@enduml
```
