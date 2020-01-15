# RETROSPECTIVE - Sprint 3

Group D

## PROCESS MEASURES

### Macro statistics

We committed to 9 stories and we implemented all of them.

|  | Total | Committed | Implemented |
| --- | --- | --- | --- |
| Stories | 30 | 9 | 9 |
| Points | 151 | 38 | 38 |

In the following table, the overall number of hours estimated and actual.
We are not taking into accounts hours related to tasks which don't concern stories (for example bug fixing tasks).

|   |  Hours estimated  | Actual hours |
|---|---|---|
| Overall | 39.25 | 40.50 |

A story is done ONLY if it fits the Definition of Done:

* Unit Tests passing: rspec, rails tests;
* Code review completed: at the end of each story (exploiting pull requests and reviews of GitHub);
* Code present on VCS: git on GitHub;
* End-to-End tests performed: rspec.


### Detailed statistics

#### Hours and tasks

Considering only committed stories, the total number of tasks belonging to the committed stories is 41.

Dividing the number of tasks by the number of committed stories, on average there are 4.56 tasks per story.

|   |  Hours estimated  | Actual hours |
|---|---|---|
| Per task  | 39.25/41=0.96 | 40.50/41=0.99 |

Standard deviation hours estimated: 2.30
Standard deviation hours actual: 2.05


#### Stories


| id story  |  number of tasks  | points  | total hours estimation | total hours spent
|---|---:|---:|---:|---:|
| story#10  | 4 | 3 | 3.25 | 3.75 |
| story#13  | 4 | 3 | 3.25 | 3.25 |
| story#14  | 7 | 13 | 10.25 | 9.25 |
| story#15 | 5 | 3 | 4.75 | 5.25 |
| story#16 | 4 | 2 | 3.50 | 2.75 |
| story#18 | 5 | 5 | 4.00 | 4.75 |
| story#19 | 4 | 3 | 2.50 | 2.25 |
| story#25 | 4 | 3 | 3.75 | 4.25 |
| story#28 | 4 | 3 | 4.00 | 5.00 |
| story#0style | 1 | NA | 1.50 | 1.50 |
| story#0responsiveness | 1 | NA | 0.50 | 0.50 |
| story#0bug | 3 | NA | 3.00 | 3.50 |
| story#0validation | 3 | NA | 5.50 | 3.50 |
| story#sonarqube | 2 | NA | 3.00 | 3.00 |
| story#docker |  1 | NA |  8.00 | 12.00 |

**Note**:

* story#0style is related to make a uniform interface style.
* story#0responsiveness is related to make forms responsive.
* story#0bug is related to major bug fixing.
* story#0validation is related to have input validation for all forms.
* story#sonarqube is related to improve our technical debt.
* story#docker is related to both release1 and release2.
 
#### Error ratio

The total task estimation error ratio, given by the sum of total hours estimation over the sum of total hours spent is equal to 39.25/40.50=0.97.

We can say that, on average, the task estimation was accurate, since the total task estimation error ratio is near to 1.

## QUALITY MEASURES
* Unit Testing:
	- Total hours estimated: 1.45
	- Total hours spent: 1.45
	- Nr of automated unit tests: ?
	- Coverage (if available): 88.24%

* E2E testing:
	- Total hours estimated: 3.05
	- Total hours spent: 3.05

* Code review
	- Total hours estimated: 5.00
	- Total hours spent: 3.75

* Technical Debt management (i.e., analysis with SonarQube, evaluation of issues, remediation):
	- Total hours estimated: 3.00
	- Total hours spent: 3.00

* Overall Technical Debt at the demo:
	- number of days: 0d (21min)
	- debt ratio: 0.0%
	- rating: A

	
## STORIES COMPARISON


### Estimated time

| Story points | Average of estimated time(hours) |
| --- | --- |
| 2 | 3.50 |
| 3 | 3.58 |
| 5 | 4.00 |
| 13 | 10.25 |

**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 3 | 5 | 13 |
| --- | --- | --- | --- | --- |
| 2  | 1    | 0.98 | 0.86 | 0.34 |
| 3  | 1.02 | 1    | 0.90 | 0.35 |
| 5  | 1.14 | 1.12 | 1    | 0.39 |
| 13 | 2.93 | 2.86 | 2.56 | 1    |

**Considerations on averages**

Story#18, of 5 story points, has been a little overestimated. On average, stories of 2, 3 and 5 story points have very similar estimated times.

### Actual time

| Story points | Average of actual time(hours) |
| --- | --- |
| 2 | 2.75 |
| 3 | 3.96 |
| 5 | 4.75 |
| 13 | 9.25 |


**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 3 | 5 | 13 |
| --- | --- | --- | --- | --- |
| 2  | 1    | 0.69 | 0.58 | 0.30 |
| 3  | 1.44 | 1    | 0.83 | 0.43 |
| 5  | 1.73 | 1.20 | 1    | 0.51 |
| 13 | 3.36 | 2.33 | 1.95 | 1    |

**Considerations on averages**

Looking at ratios, actual times are more coherent with estimated story points than estimated times. This indicates that estimation of the stories of this sprint was actually quite accurate.


## ASSESSMENT

* What caused your errors in estimation (if any)?
	* _Story #18_: this story was a little overestimated since it required less work to implement it than expected. This could be explained because we adopted an already existing template implemented for other stories to implement this story. Using a predefined template helped us in implement this story faster.
	* _Story #28_: this story was a little underestimated. It could have been a 5 point story. This happened because initially we didn't take into account some details of the teacher view of the timetables, which has a slightly different logic in respect to the one of the parent view.
	* _Story #15_: also this story could be of 5 story points. This was mainly because additional logic had to be added to the application, more than expected.
	* _Story#docker_: we took more time than expected in making all docker components work because of our initial lack of knowledge in using this technology.

* What lessons did you learn (both positive and negative) in this sprint?

	Positive:

	* Dedicating the last days of the sprint in finding and fixing bugs lead to a better-working product.
	* Having both backend and frontend validations helps in finding bugs.

	Negative:
	
	* When you wrongly design the logic of a new feature it will take more time to implement it efficiently and solving bugs. For example, the way we implemented the backend logic to manage absences created multiple bugs in our frontend pages, and it was very hard to fix them.
	* Finding and fixing bugs take a huge amount of time.

* Which improvement goals set in the previous retrospective were you able to achieve?

	The only improvement proposed in the last sprint was "Make Docker work properly (technical task)"
	We managed to make it work properly, also if it took more time than expected.
	
* Which ones you were not able to achieve? Why?

	We achieved the only improvement previously proposed.

* Propose 1 or 2 improvement goals for the next sprint and specify how to achieve them (technical tasks, team coordination, etc.)
	* Keep finding bugs and fix them
	* Add more constraints among objects belonging to different classes of the database, in order to avoid errors generated by inaccurate users.

* Proud of

	* Mobile support: responsiveness of pages
	* Timetables upload and management
	
