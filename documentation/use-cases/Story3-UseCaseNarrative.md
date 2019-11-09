# STORY 3 - USE CASE NARRATIVE

<b>Use case</b>: Enable access to parents.  

<b>Scope</b>:  /   

<b>Level</b>: User-goal  

<b>Intention in context</b>: The administrative officer wants to enable access to parents of a given student.  

<b>Primary actor</b>: Administrative officer.  

<b>Secondary actor(s)</b>:  /  

<b>Stakeholders' interests</b>:  
	
* Administrative officer: would like to enable parents in a small number of steps
* Parent: would like to be enabled in a short time

<b>Precondition</b>:

* There should be enrolled students

<b>Minimum guarantees</b>:  /  

<b>Success guarantees</b>: The parent is enabled to access the portal.  

<b>Triggers</b>:  /  

<b>Main Success Scenario</b>:  

1. The administrative officer selects a student
2. The administrative officer clicks for adding a parent to the student
3. The system prints a form to be compiled with parent's data
4. The administrative officer compiles the form
5. The system asks for confirmation
6. The administrative officer confirms
7. The system sends an e-mail to the parent with credentials to log-in to the portal
8. The system confirms that the parent has been enabled to access the portal

The use case terminates with success.  

<b>Extensions</b>:  

&nbsp;&nbsp; <b>4a.</b> The administrative officer cancels: the use case ends in failure  
&nbsp;&nbsp; <b>4b.</b> The administrative officer compiles the form with not valid data (e.g. wrong e-mail format): the system shows a warning message  
&nbsp;&nbsp; <b>6a.</b> The administrative officer cancels: the use case ends in failure  
&nbsp;&nbsp; <b>7a.</b> The system fails in sending the e-mail: the use case ends in failure
   



