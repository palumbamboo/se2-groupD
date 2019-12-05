# Retrospective - Sprint 2

Group D

## Stories and tasks

### Stories and points

We committed to 5 stories and we implemented all of them. Some of the stories committed where "work in progress" stories from last sprint.

|  | Total | Committed | Implemented |
| --- | --- | --- | --- |
| Stories | 30 | 5 | 5 |
| Points | 151 | 28 | 28 |

### Tasks and hours

The total number of tasks belonging to the committed stories were 41. 10 tasks of them, belonging to "work in progress" stories, where already completed, so they are not taken into account in counting tasks and hours. So, the total number of tasks implemented is 31.

|   |  Average  |
|---|---|
| Actual hours per task  | 1.12  |
| Tasks per story | 31/5=6.20  |


|   |  Hours estimated  | Actual hours |
|---|---|---|
| Per task  | 32.50/31=1.05 | 34.75/31=1.12 |
| Overall | 32.50 | 34.75 |

The total task estimation error ratio, given by the division between actual and estimated time is: 34.75/32.5=1.07.

We can say that the task estimation was quite accurate, since the total task estimation error ratio is near to 1.

## Stories comparison

For this section, in order to evaluate properly all implemented stories, we considered also tasks already implemented in the previous sprint into "work in progress" stories. This is appropriate in order to perform a correct evaluation of errors during the estimation process.

### Estimated time

| Story points | Average of estimated time(hours) |
| --- | --- |
| 2 | 4.50 |
| 5 | 10.0 |
| 8 | 10.50 |

**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 5 | 8 |
| --- | --- | --- | --- |
| 2 | 1 | 0.45 | 0.43 |
| 5 | 2.22 | 1 | 0.95 |
| 8 | 2,33 | 1.05 | 1 |

**Considerations on averages**

The ratio between stories of 2 and 5 points is correct, since stories of 5 points have been estimated to require on average a bit more of the double of the effort required for stories of 2 points. However, ratios between stories of points (2, 8) and (5, 8) are not so precise. On average, stories of 8 points have been estimated to require an effort that is similar to the one required for implementing stories of 5 points.

### Actual time

| Story points | Average of actual time(hours) |
| --- | --- |
| 2 | 5.00 |
| 5 | 9.00 |
| 8 | 10.63 |


**Ratio of averages**

In the following table, ratios are computed dividing the column value over the row value.

| Story points | 2 | 5 | 8 |
| --- | --- | --- | --- |
| 2 | 1 | 0.56 | 0.47 |
| 5 | 1.80 | 1 | 0.84 |
| 8 | 2.13 | 1.18 | 1 |

**Considerations on averages**

Those results lead to the same considerations made for the estimated time, in the previous paragraph. On average, stories of 8 points required a total effort similar to the one of 5 points.


### Considerations

For what concerns single stories: 

* _Story #6_ was overestimated. 8 story points were assigned to it, but it required an effort a bit bigger than a 2 point story. This consideration could be done also when the story was divided into tasks. Assigning an estimated time for each task, it turned out that the story could have been estimated as a 3 points story.
* _Story #3_ was slightly underestimated, since, dividing it into tasks, it turned out to be more elaborated than expected. Probably, it could have a value of approximately 13 story points.
* Remaining stories were estimated in a quite accurate way.

## What caused errors in estimation

* _Story #6_: working on this story, it turned out that the implementation logic was really similar to the logic of another story, so the effort required to implement this story was smaller than the one expected. Indeed, the other story worked as a sort of template to implement also this story.
* _Story #3_: we underestimated this story because, when we did the estimation poker, it was not clear for us which could be the implications consequent to enabling access to parents. We didn't take into account some details: all the logic concerning creating a new account for parents, enabling it, send emails with initial credentials and perform the mandatory change of the password at the first access to the website.

## Definition of Done

* **Unit test**: rspec, rails tests;
* **Code review**: at the end of each story (exploiting also pull requests);
* **Code on VCS**: git on GitHub;
* **Performed E2E test**: rspec.

## Lessons learned

Positive:

* The first initial sprint, which was dedicated to learning a new language and framework, was really useful in order to work better in this sprint. This can be easily seen also comparing the number of stories committed and implemented in both sprints.
* It's easier and faster to implement new features when you have a clear idea of how the logic should be done and you have implemented features with a similar implementation logic.

Negative:

* Sometimes, when a template or an interface for a web page is not clearly defined in advance all together, it could take more time to implement that webpage since different people could think about different implementations.
* For what concerns Docker, we encountered some problems. That is because initially it was not clear what we shoud have done and for this reason we wasted a lot of time in trying to do unrequired operations.

## Possible improvements

* Learn how Docker works.
* Define more precise templates for our web pages.


## Proud of

* Interface style;
* Management of parent accounts;
* Organization of views with different topics for different account types.

