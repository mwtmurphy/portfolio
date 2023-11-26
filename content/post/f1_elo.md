---
title: "Who is the F1 GOAT?"
date: 2023-11-20T15:00:00
draft: true
tags: ["python", "elo-scoring", "streamlit"]
math: True
weight: 10
---

## Context

I'm a big armchair fan of F1. I've played 100+ hours of the F1 games and there's nothing I like more on a race day than turning on the TV, muting the F1 commentary until the theme tune kicks in and feeling the wave of anxiety rush over me a few minutes before the start of a race that has no bearing on my personal life begins. If you know, you know.

Recently, and for the n-hundreth time, the golden question was raised:

> Who is the F1 greatest of all time (GOAT)?

There are many opinions. Is it Senna, Schumacher, Hamilton or Michael Masi? Sorry, too soon. Well, given I have the hammer (data science) why don't I try and find out who it is.

If you want to skip ahead and see the final results, see the results [here](https://f1-elo.streamlit.app/). If you'd like to understand the method I used, keep reading!

## Method

At time of writing, I follow the CODE method [^1] for data projects. This allows me to cast the net wide on new and existing knowledge before distilling and building an appropriate user-facing solution.

[^1]: [Building a Second Brain](https://www.amazon.co.uk/Building-Second-Brain-Organise-Potential/dp/1800812213) (last accessed 2023-11-21)