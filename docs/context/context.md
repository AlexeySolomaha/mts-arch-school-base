# Контекст решения
<!-- Окружение системы (роли, участники, внешние системы) и связи системы с ним. Диаграмма контекста C4 и текстовое описание. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375783261
-->
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

LAYOUT_WITH_LEGEND()

Person(att, "Участник конференции", "пользователь, который зарегистрировался в системе.")
Person(speaker, "Докладчик", "пользователь, который подал заявку на участие")
Person(confManager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")
System(helloconf, "Платформа helloconf.mts.ru", "позволяет организовывать и проводить IT-конференции")
System_Ext(timepad, "Timepad сервис", "сервис для регистрации для участия в запланированных событиях")

Rel(att, helloconf, "принимает участие в мероприятиях")
Rel(att, timepad, "регистрируется для участия")
Rel(timepad, att, "присылает приглашение на мероприятие")
Rel(speaker, helloconf, "направляет заявку с докладом")
Rel(speaker, helloconf, "выступает с докладом на конференции")
Rel(confManager, timepad, "получает список зарегистрировавшихся участников")
Rel(confManager, helloconf, "публикует матералы конференций, анонсы мероприятий")
@enduml
```

# Диаграмма контектов (bounded)
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

' skinparam linetype ortho
' skinparam linetype polyline

LAYOUT_WITH_LEGEND()

Person(att, "Участник конференции", "пользователь, который зарегистрировался в системе.")
Person(speaker, "Докладчик", "пользователь, который подал заявку на участие")
Person(manager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")

System_Ext(timepad, "Timepad сервис", "сервис для регистрации для участия в запланированных событиях")

Container(speechReview, "Работа с докладчиками", "1.1.1 Работа с докладчиками", "Рецензирование докладов и утверждение кандидатов-докладчиков")

Container(scheduling, "Работа с расписаниями", "1.1.2 Работа с расписаниями", "Составление пасписания выступлений докладчиков на конференции")

Container(conductingConference, "Проведение конференции", "1.1.3 Проведение конференции", "Составление пасписания выступлений докладчиков на конференции")

' Container(publishingData, "Публикование материалов прошедших конференции", "1.1.4 Публикование материалов прошедших конференции") 

Lay_R(att, speaker)
Lay_R(timepad, speechReview)
Lay_L(scheduling, speechReview)


'Lay_R(speechReview, scheduling)

Rel(att, timepad, " ")
Rel(att, conductingConference, " ")
Rel(speaker, speechReview, " ")
Rel(manager, scheduling, " ")
Rel(manager, conductingConference, " ")
' Rel(manager, publishingData, " ")

Rel(timepad, scheduling, "Данные об участниках")
Rel(speechReview, scheduling, "Данные о докладчиках")
' Rel(conductingConference, publishingData, "Материалы прошедших конференций")

@enduml
```
## Контейнерные диаграммы
### Работа с докладчиками
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

AddElementTag("microService", $shape=EightSidedShape(), $bgColor="CornflowerBlue", $fontColor="white", $legendText="microservice")
AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

Person(speaker, "Докладчик", "пользователь, который подал заявку на участие")
Person(manager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")

Container_Boundary(speechReview, "Работа с докладчиками") {
    Container(speech_review_app, "Веб-приложение для работы с докладчиками", "html, JavaScript")
    Container(speech_review_be, "BE для работы с докладчиками", "Java, Spring Boot App")
    ContainerDb(speech_review_db, "Event Data", "PostgreSQL", "Хранение данных мероприятий", $tags = "storage")
    BiRel_D(speech_review_app, speech_review_be, "Данные о докладах", "REST HTPPS")
    BiRel_D(speech_review_be, speech_review_db, "Сохранение и чтение данных", "JDBC,SQL")
}

Container_Boundary(scheduling, "Работа с расписаниями") {
    Container(scheduling_be, "BE для работы с расписаниями", "Java, Spring Boot App")  
}

Lay_R(speaker, manager)
Rel(manager, speech_review_app, " ")
BiRel(speaker, speech_review_be, "Направляет заявку с докладом, получает рецензию", "SMTP")
Rel_R(speech_review_be, scheduling_be, "Данные о докладчиках", "REST HTPPS")

SHOW_LEGEND()
@enduml
```
### Работа с расписаниями
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

AddElementTag("microService", $shape=EightSidedShape(), $bgColor="CornflowerBlue", $fontColor="white", $legendText="microservice")
AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

Person(att, "Участник конференции", "пользователь, который зарегистрировался в системе.")
Person(manager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")

Container_Boundary(extSources, "Внешние системы-поставщики") {
    System_Ext(timepad, "Timepad сервис", "сервис для регистрации для участия в запланированных событиях")
}

Container_Boundary(speechReview, "Работа с докладчиками") {
    Container(speech_review_be, "BE для работы с докладчиками", "Java, Spring Boot App")
}

Container_Boundary(scheduling, "Работа с расписаниями") {
    Container(scheduling_app, "Веб-приложение для работы с расписаниями", "html, JavaScript")
    Container(scheduling_app_be, "BE для работы с расписаниями", "Java, Spring Boot App")
    ContainerDb(scheduling_db, "Event Data", "PostgreSQL", "Хранение данных мероприятий", $tags = "storage")
    BiRel_D(scheduling_app, scheduling_app_be, "Данные о расписаниях", "REST HTPPS")
    BiRel_D(scheduling_app_be, scheduling_db, "Сохранение и чтение данных", "JDBC,SQL")
}

Container_Boundary(conductingConference, "Проведение конференций") {
    Container(conf_app_be, "BE для сотрудников приложения", "Java, Spring Boot App")
}

Lay_R(att, manager)
Lay_D(timepad, speech_review_be)

Rel_U(timepad, att, "присылает приглашение на мероприятие", "SMTP")
Rel_D(att, timepad, "регистрируется для участия", "HTPPS")

Rel_D(manager, scheduling_app, " ")
Rel_R(timepad, scheduling_app_be, "Данные об участниках", "REST HTPPS")
Rel_R(speech_review_be, scheduling_app_be, "Данные о докладах", "REST HTPPS")
Rel_R(scheduling_app_be, conf_app_be, "Данные о расписании", "REST HTPPS")

SHOW_LEGEND()
@enduml
```
### Проведение конференций
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

AddElementTag("microService", $shape=EightSidedShape(), $bgColor="CornflowerBlue", $fontColor="white", $legendText="microservice")
AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

Person(manager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")


Container_Boundary(scheduling, "Работа с расписаниями") {
    Container(scheduling_app_be, "BE для работы с расписаниями", "Java, Spring Boot App")
}

Container_Boundary(conductingConference, "Проведение конференций") {
    Container(conf_app, "Веб-приложение для проведения конференций", "html, JavaScript")
    Container(conf_app_be, "BE для проведения конференций", "Java, Spring Boot App")
    ContainerDb(conf_db, "Event Data", "PostgreSQL", "Хранение данных мероприятий", $tags = "storage")
    BiRel_D(conf_app, conf_app_be, "Данные о конференции", "REST HTPPS")
    BiRel_D(conf_app_be, conf_db, "Сохранение и чтение данных", "JDBC,SQL")
}

Rel(manager, conf_app, " ")
Rel_R(scheduling_app_be, conf_app_be, "Данные о расписаниях", "REST HTPPS")

SHOW_LEGEND()
@enduml
```