---
title: "Sidekick"
date: 2021-02-18T15:00:00
draft: true
tags: ["automation", "python", "webapp"]
math: true
---

## Summary

`sidekik` is a web app, used for automating the process of creating a warm-up routine for a workout.

A user can submit up to 5 workout movements and the app auto-suggests the best warm-up movements to perform for the workout:

![Warm-up creation result](/img/sidekick/create_warmup.png)

The app is currently offline due to Heroku sunsetting their free DB option.

## Problem Case

A CrossFit coach wanted to understand if there was a simpler way to create warm-ups for the workouts he programmed for clients and classes. The issues we discussed were:

#### Remembering Movements

CrossFit is known for its variety in movement (Olympic lifting, metabolic conditioning and gymnastics). With that, comes the process of creating the best warm-up to prime yourself for all the movements in a workout. It's not to say they can't all be remembered, but it would be preferential to have a checklist to focus on the fun bit of the workout, i.e. THE workout. 

#### Managing A Workaround

So you've decided to jot down the list of warm-up movements for the workouts you do in an Excel file:

![Large list of workout and warmup movements](/img/sidekick/excel_sheet.png)

Yum.

Keeping track of movements this way creates information overload with a nice sprinkling of analysis paralysis long-term, i.e. you've got so many movements to look at every time you open this file, it becomes daunting to just open the file - let alone create a workout from it.

## Requirements

The business requirements we set for solving this problem were that it needed to:

1. Remove the analysis paralysis problem
2. Have persistent storage for admins to add, edit and delete movements
3. Be easily accessible for admins (people adding movements) and users (people creating workouts)

## App Design

Given the scale of the problem, a lightweight package like Flask was the preferred solution for app development versus Django. 

With the data being structured, a relational database was used to store the data persistently, grouping the movement data into 2 categories:

* Workout movements
* Warm-up movements

This way, a workout could have many warm-up movements associated with it and vice-versa, i.e. a many-to-many relationship.

Paired with the `flask-admin` plugin and some additional user management with `flask-login`, the coach can easily add, edit, delete and link movements.

Finally, for easy accessibility, I chose Heroku to deploy the app. With a free PostgreSQL add-on, I could replicate the environment locally to ensure everything worked well before deploying, completing requirements `2` and `3`.

## Creating a Warm-up

Translating requirement `1`, the technical requirements I set were:

<ol type="a">
  <li>The solution needs to take less than 5 seconds</li>
  <li>The number of movements suggested must be less than 5</li>
  <li>Any viable warm-up must not superset any other viable warm-up</li>
</ol>

To suggest warm-ups, each movement was labelled based on it's [type](https://www.asirecreation.org/recreport/ask-trainer/63-ask-a-trainer-archive/302-the-fundamental-human-movements) such that each workout movement can be classified by the underlying warm-up movement types, e.g.:
<br><br>
| Movement | ... | Push | Pull | Squat | ... |
| --- | --- | --- | --- | --- | --- |
| Move 1 | ... | 1 | | | ... |
| Move 2 | ... | 1 | 1 | | ... |
| Move 3 | ... | | 1 | | ... |
| Move 4 | ... | | | 1 | ... |

A warm-up is considered viable if the sum of all rows yields at least a 1 in each movement type. This then allows any superset to be identified through the movement names afterwards, ticking off requirements `b` and `c`.

Two methods investigated for creating warm-ups were combinations and directed trees, the former creating all possible sequences of movements and working backwards to find viable warm-ups and the later iteratively identifying movements that paired with each other to create a viable warm-up moving forward.

The difficulty with both was that they are non-linear functions of `n`. Let `k` = 5 where `k` equals the number movements in a warm-up routine, and `n` > 5, the number of available warm-up movements provided to the hypothetical function, a combinations-based function is $O(n^5)$ in complexity whilst a directed tree is even worse, performing at the upper limit of $O(n^{n-1})$.

Where an average workout movement has ~20 potential warm-up movements, this solution wasn't scalable. Limiting the number of sequences explored and the amount of out edges per node brought these functions down to $O(n)$ in complexity.

Finally, weighting movements dependent on their type yielded a performance improvement for directed trees versus combinations, with validation testing showing a "Limited Weighted Directed Trees" function was the best solution and met requirement `a` (see <a href="#appendix">appendix</a> for validation results).

## Client Feedback

User testing is currently ongoing and this section will be updated shortly.

## Acknowledgements

Shoutout to Miguel Grinberg who put together the [Flask Mega-tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world), whom I constantly referred to when running into issues.

## Appendix

<a href="/img/sidekick/create_warmup_time.png">![Function Time vs Movements Submitted](/img/sidekick/create_warmup_time.png)</a>
<br>
<a href="/img/sidekick/create_warmup_count.png">![Warm-ups Created vs Movements Submitted](/img/sidekick/create_warmup_count.png)</a>
