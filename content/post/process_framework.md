---
title: "Process framework"
date: 2019-11-11T15:00:00
draft: true
tags: ["productivity", "python"]
math: true
---

## Summary

Dirta Science is a theme for the Python3 `cookiecutter` package that implements `CRISP-DM`, using GitLab for CI and project phase tracking. 

It allows you to create a standardised directory structure for easy maintainability of data science projects, with make commands for implementing unit testing and virtual environment management.

Start using it by installing [cookiecutter](https://cookiecutter.readthedocs.io/) and executing:

```
cookiecutter https://gitlab.com/mwtmurphy/dirta-science
```

on your terminal of choice.

## Problem Case

#### Project Management

End-to-end data science projects will usually follow these steps:

1. Understanding business and technical requirements
2. Data collection
3. Data cleaning
4. Data modelling
5. Deployment

Typically, these tasks begin sequentially but can easily be retread when things change, e.g. business requirements, or challenges arise, e.g. limitations of deployment environment. These kinds of changes affect the "discovery process" because they impact:

* Data captured
* Domain knowledge
* Analytical method
* User biases

Without tracking these changes, it becomes difficult to differentiate between what discovered knowledge is valuable or not, which can cause project creep.

#### Project Homogeneity

Additionally, if not predefined, it can be a dice roll as to how a project may be architected. Could it be a directory full of Python scripts or maybe some Jupyter notebooks? Will I see a final final draft? 

This is not the fault of the team, but just the outcome of multiple people working on a project with little/no structure and limited memory. Imagine coming back to an unstructured project in 6 months and trying to remember what you did...

## Solution

A quick search and you'll find many frameworks (KDD, SEMMA, etc.). Having looked at KDD and CRISP-DM, CRISP-DM provided some lower-level project start questions than KDD and, therefore, a better ability to track the impact of changes. With `Dirta Science` the CRISP-DM template documents are made readily available. I've found it's not a painless solution, but it's certainly a step in the right direction to checklist things that can be easily missed.

`cookiecutter` is a great way to easily set up a standardised project structure, and building a custom theme was a simple process. Initially based on [Cookiecutter Data Science](https://drivendata.github.io/cookiecutter-data-science/), I've come to the current architecture, integrating GitLab's CI tool, and adding in unit testing and `virtualenv` within the theme. Again, it's not a perfect solution and deviating from this format has sometimes been necessary, e.g. projects using MATLAB's app designer. 

See the repository [here](https://gitlab.com/mwtmurphy/dirta-science).

## Acknowledgements

Shoutout to Cookiecutter Data Science, without whom I wouldn't have gone down this 'mild' rabbit hole to improve my process. 

## Bibliography

Chapman, P., Clinton, J., Kerber, R., Khabaza, T., Reinartz, T., Shearer, C. and Wirth, R. (2000). CRISP-DM 1.0 Step-by-step Data Mining Guide. Technical Report. The CRISP-DM Consortium.

Frawley, W., Piatetsky-Shapiro, G. and Matheus, C. (1992). Knowledge Discovery in Databases: An Overview. AI Magazine, (Vol 13, No 3), pp.57-69.
