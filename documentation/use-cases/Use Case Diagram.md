``` plantuml
left to right direction

actor Parent as p
actor Teacher as t
actor "Administrative Officer" as ao

(Know marks of my child) as marks
(Record daily lecture topics) as record
(Enable access to parents) as access
(Enroll the students) as enroll

p -- marks
t -- record
ao -- access
ao - enroll
```