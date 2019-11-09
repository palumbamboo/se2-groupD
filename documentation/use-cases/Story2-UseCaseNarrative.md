# STORY 2 - USE CASE NARRATIVE

<b>Use case</b>: Record daily lecture topics  

<b>Scope</b>:  /   

<b>Level</b>: User-goal  

<b>Intention in context</b>: The teacher wants to record lecture activities to to keep track of work done and inform parents.  

<b>Primary actor</b>: Teacher.  

<b>Secondary actor(s)</b>:  /  

<b>Stakeholders' interests</b>:  
	
* Teacher: would like to easily and quickly record lecture activities, without having to think about the formatting of the text and with the possibility of modifying it if wrong. 
* Parent: would like easily understand topics of the lecture.

<b>Precondition</b>: 

* There should be an authorized teacher in a valid open lecture

<b>Minimum guarantees</b>:  /  

<b>Success guarantees</b>: Topic are registered in the portal and they can be viewed 

<b>Triggers</b>:  /  

<b>Main Success Scenario</b>:  

1. The teacher clicks to add topics to the lecture
2. The system show a textfield to be compiled with lecture data
3. The teacher compiles the field
4. The system shows the preview and asks for confirmation
5. The teacher confirms
6. The system updates lecture with data about topics
7. The system shows update confirmation

The use case terminates with success.  

<b>Extensions</b>:  

&nbsp;&nbsp; <b>1a.</b> The teacher cancels: the use case ends in failure  
&nbsp;&nbsp; <b>3b.</b> The teacher compiles the text field with not valid data: the system shows a warning message  
&nbsp;&nbsp; <b>5a.</b> The teacher cancels: the use case ends in failure  
&nbsp;&nbsp; <b>6a.</b> The system fails in updating data: the use case ends in failure
   

