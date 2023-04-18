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
