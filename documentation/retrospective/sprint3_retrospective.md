# RETROSPECTIVE - Sprint 3

Group D

## PROCESS MEASURES

### Macro statistics

We committed to 8 stories and we implemented 7 of them.

|  | Total | Committed | Implemented |
| --- | --- | --- | --- |
| Stories | 30 | 8 | 7 |
| Points | 151 | 29 | 26 |

In the following table, the overall number of hours estimated and actual.

|   |  Hours estimated  | Actual hours |
|---|---|---|
| Overall | 52.50 | 51.75 |

A story is done ONLY if it fits the Definition of Done:

* Unit Tests passing: rspec, rails tests;
* Code review completed: at the end of each story (exploiting pull requests and reviews of GitHub);
* Code present on VCS: git on GitHub;
* End-to-End tests performed: rspec.


### Detailed statistics

#### Hours and tasks

Considering only committed stories, the total number of tasks belonging to the committed stories is 41.

Dividing the number of tasks by the number of committed stories, on average there are 5.86 tasks per story.

|   |  Hours estimated  | Actual hours |
|---|---|---|
| Per task  | 52.50/41=1.28 | 51.75/41=1.26 |

Standard deviation hours estimated: 2.07
Standard deviation hours actual: 1.92


#### Stories


| id story  |  number of tasks  | points  | total hours estimation | total hours spent
|---|---:|---:|---:|---:|
| story#7  | 6 | 3 | 6.50 | 6.25 |
| story#8  | 6 | 5 | 7.00 | 9.00 |
| story#9  | 4 | 2 | 5.00 | 6.00 |
| story#11 | 5 | 3 | 8.00 | 7.50 |
| story#12 | 7 | 5 | 8.75 | 8.50 |
| story#17 | 4 | 3 | 6.00 | 4.50 |
| story#30 | 9 | 5 | 11.25 | 10.00 |
| story#0 | 3 | NA | 5.00 | 5.50 |
| story#docker |  1 | NA |  3.00 | 5.00 |

**Note**: story#0 concerns tasks related to make a uniform interface style, make sidebar and tables responsive.
 
#### Error ratio

The total task estimation error ratio, given by the sum of total hours estimation over the sum of total hours spent is equal to 52.50/51.75=1.01.

We can say that, on average, the task estimation was accurate, since the total task estimation error ratio is near to 1.

## QUALITY MEASURES
* Unit Testing:
	- Total hours estimated: 3.50
	- Total hours spent: 2.25
	- Nr of automated unit tests: 7
	- Coverage (if available): -

* E2E testing:
	- Total hours estimated: 4.00
	- Total hours spent: 3.00

* Code review
	- Total hours estimated: 4.75
	- Total hours spent: 5.75

	Story#8 took much more time than expected in performing code review, because an external library was added and it brought to the necessity of checking a lot of modifications.

* Technical Debt management (i.e., analysis with SonarQube, evaluation of issues, remediation):
	- Total hours estimated: 0.50
	- Total hours spent: 0.50
	
	Technical Debt management will be done in the next sprint. Analysis with SonarQube has been done to provide a view on the overall technical debt at the demo.

* Overall Technical Debt at the demo:
	- number of days: 3d 4h
	- debt ratio: 0.1%
	- rating: A

	
## STORIES COMPARISON


### Estimated time

| Story points | Average of estimated time(hours) |
| --- | --- |
| 2 | 5 |
| 3 | 6.83 |
| 5 | 9 |

**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 3 | 5 |
| --- | --- | --- | --- |
| 2 | 1 |  0.73 |  0.56 |
| 3 | 1.37  | 1 |  0.71 |
| 5 | 1.80  | 1.32 | 1 |

**Considerations on averages**

Ratios between stories are quite accurate.

### Actual time

| Story points | Average of actual time(hours) |
| --- | --- |
| 2 | 6 |
| 3 | 6.08 |
| 5 | 9.17 |


**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 3 | 5 |
| --- | --- | --- | --- |
| 2 | 1 | 0.99  | 0.65  |
| 3 | 1.01  | 1 | 0.66  |
| 5 | 1.53  | 1.51  | 1 |

**Considerations on averages**

Looking at ratios of actual times, on average stories of 2 points have been a bit underestimated. Their average actual time is similar to the average one of stories of 3 points. The remaining estimations were quite accurate.


## ASSESSMENT

* What caused your errors in estimation (if any)?
	* _Story #30_: this story has been underestimated when 5 points were assigned to it. Looking at estimated and actual hours, 8 points were most suitable. This happened because some issues related to creating the internal accounts were not clear at the estimation time (for example, the principal user did not exist before the implementation of this story)
	* _Story#docker_: the task related to Docker, that is still open, took more time than expected. We encountered troubles in making it work correctly.

* What lessons did you learn (both positive and negative) in this sprint?

	Positive:

	* As the number of sprints increases, it's possible to implement more functionalities in less time.
	* If the code is well structured, it's easy to add functionalities similar to the one already implemented.

	Negative:
	
	* Docker took more time than expected and it will take other time in the next sprint.
	* Making code and interfaces clearer and well structured can waste time that was initially assigned to implementing other stories. This can lead to uncompleted stories.

* Which improvement goals set in the previous retrospective were you able to achieve?

	One of the two possible improvements set in the previous sprint was: 	"Define more precise templates for our web pages". In this sprint we 	achieved to have a unique style for web pages. 

* Which ones you were not able to achieve? Why?

	The other improvement was:
	"Learn how Docker works". We learned new things about Docker, but still 	we don't know enough to make it work properly.

* Propose 1 or 2 improvement goals for the next sprint and specify how to achieve them (technical tasks, team coordination, etc.)
	* Make Docker work properly (technical task): a common effort in understanding how to create a unique image and run it on every computer.

* Proud of

	* Uniform interface style
	* Upload and download file management
	
