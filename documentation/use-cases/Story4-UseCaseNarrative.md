# STORY 4 - USE CASE NARRATIVE

**Use case**: Enroll students  

**Scope**:  /   

**Level**: User-goal  

**Intention in context**: The administrative officer wants to enroll students in the school  

**Primary actor**: Administrative officer

**Secondary actor(s)**:  /

**Stakeholders' interests**: 

* Administrative officer: would like to enroll students in a small number of steps
* Principal: would like to offer school services (e.g. class forming, rooms handling, etc.) on the basis of the number of students enrolled
* Parent: would like his/her child/children to be successfully enrolled in the school

**Precondition**:

* The maximum number of enrollable students should be greater than the currently enrolled one

**Minimum guarantees**:  /

**Success guarantees**: The student is enrolled in the school

**Triggers**:  /

**Main Success Scenario**:  

1. The administrative officer provides information about the student
2. The system
   - validates information
   - asks for confirmation
3. The administrative officer confirms
4. The system confirms that the student has been enrolled

The use case terminates with success.  

**Extensions**:  

**2a.** The system detects invalid information for the student (e.g. wrong date of birth) : 
​		**2a.1** The system shows an error message
​		**2a.2** The administrative officer fixes the error
​		**2a.3** Use case continues at step 2

**3a.** The administrative officer cancels : the use case continues at step 1

**4a.** The system is not able to store information :
​		**4a.1** The system shows an error message suggesting to try again later
​		**4a.2** The use case ends in failure