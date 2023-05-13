# Компонентная архитектура

## Контейнерная диаграмма

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

AddElementTag("microService", $shape=EightSidedShape(), $bgColor="CornflowerBlue", $fontColor="white", $legendText="microservice")
AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

Person(att, "Участник конференции", "пользователь, который зарегистрировался в системе.")
Person(speaker, "Докладчик", "пользователь, который подал заявку на участие")
Person(manager, "Организатор конференции", "сотрудник ПАО МТС, ответственный за организацию и проведение мероприятий")

System_Boundary(helloconf, "Платформа helloconf.mts.ru") {
    Container(user_app, "Веб-приложение для пользователей", "html, JavaScript", "Портал helloconf.mts.ru")
    Container(bo_app, "Веб-приложение для сотрудников", "html, JavaScript", "Back-office платформы helloconf.mts.ru")
    Container(user_app_be, "BE для пользовательского приложения")
    Container(bo_app_be, "BE приложения для сотрудников")
    ContainerDb(storage_db, "Event Data", "PostgreSQL", "Хранение данных мероприятий", $tags = "storage")
}

System_Ext(timepad, "Timepad сервис", "сервис для регистрации для участия в запланированных событиях")

'Lay_R(helloconf, timepad)
'Lay_R(speaker, manager)
'Lay_R(bo_app, storage_db)

BiRel(att, user_app, "Заявка на участие как зритель", "REST HTPPS")
Rel_R(speaker, bo_app_be, "Направляет заявку с докладом", "SMTP")
Rel_L(bo_app_be, speaker, "Получает результат рецензирования доклада", "SMTP")
BiRel(manager, bo_app, "Публикует матералы, составляет расписание конференций", "REST HTPPS")
BiRel(manager, bo_app, "Рецензирует доклады", "REST HTPPS")
Rel(manager, timepad, "Получает список зарегистрировавшихся участников")

BiRel_D(user_app, user_app_be, "Получение материалов конференций", "REST HTPPS")
BiRel_D(bo_app, bo_app_be, "Работа с данными о докладчиках и расписании конференции", "REST HTPPS")

BiRel(user_app_be, storage_db, "Сохранение и чтение данных", "JDBC,SQL")
BiRel_D(bo_app_be, storage_db, "Сохранение и чтение данных", "JDBC,SQL")

Rel_U(timepad, att, "присылает приглашение на мероприятие", "SMTP")
Rel_R(att, timepad, "регистрируется для участия", "HTPPS")
'Rel(manager, timepad, "получает список зарегистрировавшихся участников")

SHOW_LEGEND()
@enduml
```
