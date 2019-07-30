# App

## Instructor agrees to try Nudge

* Nudge staff explains purpose of Nudge to instructor.
* Nudge staff explains Nudge process to instructor.
* Instructor agrees to participate in Nudge.
* Nudge staff helps instructor complete course setup
    * Faculty Nudge Initial Setup Form SV_eyAk5iZgcvRw1OB
    * Form submits entry to Nudge::Nudge Database::Courese

IS THIS NEEDED? CAN'T I JUST USE THE TEMPLATE AND PIPE EVERYTHING IN?
* !Nudge creates a new group for the course

```
curl -X POST -H 'X-API-TOKEN: yourtokenhere' -H 'Content-Type: application/json' -d '{
    "type": "GT_1234567890AbCdE",
    "name": "Beatles"
}' 'https://yourdatacenterid.qualtrics.com/API/v3/groups'
```

* !Nudge staff copies Nudge templates for new course.

```
curl 'https://yourdatacenterid.qualtrics.com/API/v3/surveys' \
-X POST \
-H 'X-API-TOKEN: yourtokenhere' \
-H 'X-COPY-SOURCE: surveyIdHere' \
-H 'X-COPY-DESTINATION-OWNER: userIdHere' \
-H 'Content-Type: application/json' \
-d '
    {
    	"projectName": "My new copied survey"
    }
   ' 
```

* !Nudge staff sends Qualtrics survey to acquire student contact data (email/cell phone number)

    

* !Nudge staff sends student contact acquisition form link to instructor.
* !Nudge staff sends Nudge faculty initial setup form to instructor.
    * course title
    * may want to add instructor name for survey naming convention
    * course number
    * number of students
    * day/time class held
    * day/time Nudges should go to students
    * day/time for instructor to receive form into which they put Nudge questions/answers

## Student contact info acquired

* Instructor distributes contact acquisition form link to students.
* Students who want to participate in Nudge click on the link.
* Students who want to participate in Nudge provide name and email or cell phone number (with country code) in the form at the link.
    * cell phone number may have formatting challenges
    * Students may also send NetID (or have it auto-captured via SSO login, ask Kim M), if instructor requests
* Form sends contact information to Qualtrics.
* !Contact list downloaded as a CSV file.
* !CSV file uploaded to Qualtrics as a contact list for the course Nudges.
* Qualtrics provides opt-out option for students who change their minds.  
* !System should send a confirmation of the contact list being created to the LI staff or instructor if done programmatically

## Nudge question schedule determined

* !Newman/Travis - Instructor provided schedule for preferred time and day of the week for a weekly reminder question form
    * currently handled by Zapier automation (need to set up at beginning of term and manually end at the close of the term) sending the same URL link every time for a single course, but a unique copy of the survey is made per course
    * may consider adding fields to identify either the course or instructor to enable use of a single survey for all instructors throughout the term (or more?)
* !Newman/Travis - Instructor provided schedule for a preferred time and day of the week for each weekly Nudge to go out to LI staff in the instructor's initial setup form
    * Data: weekday and timestamp should be pulled and used to schedule each Nudge sent to students from this course contact list
    * Destination: the student question survey

## Nudge questions acquired

* Instructor completes question form
* Data:  a single question stem, a correct answer in the first answer slot, and some number of distractor answers in the following slots, not more than 5 (and possibly tailored feedback for each answer option)
* Destination: question stem, correct answer, and distractors should be placed in a blank copy of the student question survey template

## Nudge questions sent to students

* !blank copy made of the student question survey
* !name survey by using: instructor name + "Question" + date
* !enter the question stem, correct answer, and distractors from the instructor question form
* !?set answer options to randomized order
* !schedule distribution for the weekday and time provided by instructor
    * email distribution is sent To: <contact list>
    * other fields
        * Message:  use saved message (which needs to be created in advance, custom for each course)
    * SMS distribution is similar
* !send to course contact list drawn from the student contact survey, including mode of delivery (SMS or email) with a unique URL for each user
* !confirmation of distribution to LI staff or instructor??

## Students respond to Nudge questions

* Students receive email/text with link to Nudge question.
* Students click on the link.
* Students receive Nudge question provided by instructor.
* Student selects what they believe to be the correct answer to the question.
* Student receives either confirmation that their answer was right or a notice that their answer was wrong (and an indication as to the right answer; where is this feedback provided?)
* The number of right and wrong answers are recorded without specific student identifiers in Reports

## Nudge data is available for instructor review

* On request, Nudge personnel can send information about how students (in aggregate) answered individual Nudge questions. [question: where does this live? Qualtrics?]
    * Manage public report
        * should be okay to use public report URL (data is anonymized)
        * could be done by default, or triggered upon request (maybe through a new Qualtrics form)
