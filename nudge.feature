Feature: Create course

Scenario: An instructor explains Nudge to students
  Given an instructor has chosen to offer Nudge to students 
  When the instructor explains the purpose and processes of Nudge to the students
  Then students will be able to chose whether to incorporate Nudge into their study plan. 

Scenario: An instructor collects student participants' information for Nudge
  Given an instructor has offered Nudge to students 
    and the students have chosen to participate in Nudge
  When students send their contact information (email or cell number) to Nudge
  Then students will be entered into the Nudge distribution database for their class. 

Feature: Create nudge

Scenario: An instructor designates Nudge question dates and times.
  Given an instructor has incorporated Nudge into their course plan
    and the course has a known schedule
    and the instructor has decided on the gap between content presentation and receiving the Nudge question
  When the instructor provides Nudge question dates to the Nudge system
  Then Nudge question release dates will be set up in the Nudge system
  
Scenario: An instructor sends question to Nudge 
  Given an instructor has created a quiz question based on course content 
  When the question is sent to the Nudge system
  Then a quiz question is available for delivery to the instructor's students

Scenario: An instructor schedules delivery of a Nudge question
  Given an instructor has sent a quiz question to the Nudge system
    and the instructor has chosen a time for that quiz question to go to their students
    and the instructor has provided the quiz question schedule to the Nudge system
  Then the question will be sent to the instructor's students at that time



Feature: Content distribution for Nudge, a quizzing system to support improved educational content retention

Scenario: Students receive a Nudge quiz question 
  Given an instructor provides educational content to their class
    and an instructor has created a Nudge question associated with this educational content
    and an instructor has sent the Nudge question to the Nudge delivery system
    and an instructor has chosen when to send the Nudge quiz question to students
  When the predetermined time has passed
  Then a quiz question is sent to the instructor's students about the content

Scenario: Students answer Nudge quiz question
  Given students received Nudge quiz question
  When students click on Nudge quiz question link
  Then students can try to answer the Nudge quiz question

Scenario: Instructors see student Nudge quiz results
  Given students respond to Nudge Quiz question
  When student scores are registered by Nudge
  Then Nudge system makes collected student scores available to instructors
