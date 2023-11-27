---
title: "My - not first - project boilerplate"
date: 2023-11-27T15:00:00
draft: false
tags: ["dataops", "mlops", "python"]
math: true
---

## Context

Data tasks/projects typically follow the pattern of:

1. Defining business and technical requirements
2. Completing 1-N loops of the OSEMN framework [^1]
3. Productionising and deploying a solution - when applicable.

They can sit anywhere on the MoSCoW scale [^2], grow out of scope, pivot, etc.. This choose-your-own-adventure book creates lots of opportunities for tech debt and, being something of an adventurer myself, has meant I've spawned a multiverse of approaches, some good and some not so good.

## Outcome  

Working with the garage door open, learnings from all these adventures can be found in my [project boilerplate](https://github.com/mwtmurphy/project-boilerplate). This is the boilerplate code I use to kick off new tasks and projects with, updated based on results from experimenting with ideas for tackling the areas mentioned above and all their gremlins lurking in the shadows.

Check out the README in the link above if you'd like to start using it.

## Main concepts

1. The boilerplate doesn't ask the questions for you. It's an enabler vs a silver bullet.
2. Use the relevant docs. The size of the task/project is proportional to the size of the scoping.
3. Notebooks are for prototyping. Make code reusable by porting to scripts ASAP.
4. Write for you in 6 months.
5. Take learnings from each iteration and add them to the template.

## Acknowledgements

The main influences for this boilerplate are Cookiecutter Data Science [^3], Hypermodern Python [^4], CRISP-DM [^5] and KDD [^6]. 


[^1]: [OSEMN data science lifecycle](https://www.datascience-pm.com/osemn/) (last accessed 2023-11-27)
[^2]: [The MoSCoW prioritisation method](https://monday.com/blog/project-management/moscow-prioritization-method) (last accessed 2023-11-27)
[^3]: [Cookiecutter data science](https://drivendata.github.io/cookiecutter-data-science/) (last accessed 2023-11-27)
[^4]: [Hypermodern Python](https://cjolowicz.github.io/posts/hypermodern-python-01-setup/) (last accessed 2023-11-27)
[^5]: CRISP-DM 1.0 Step-by-step Data Mining Guide
[^6]: Knowledge Discovery in Databases: An Overview