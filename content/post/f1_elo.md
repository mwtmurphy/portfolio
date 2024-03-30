---
title: "Who is the F1 GOAT?"
description: "Using data to identify the F1 greatest of all time."
date: 2023-11-20T15:00:00
draft: true
tags: ["python", "data-science", "streamlit"]
math: True
weight: 10
---

## Context

I'm a big F1 fan. I've played too many hours of multiple F1 games and there's nothing I like more on a race day than turning on the TV, butchering an impersonation of the theme tune and feeling a wave of anxiety rush over me minutes before the start of a race that has no bearing on my personal life.

Recently for the n-hundredth time, I overheard the classic F1 debate about who is the F1 greatest of all time (GOAT). There are many opinions, typically based on a mix of on-track and off-track actions. Fortunately, the folks over at [Ergast](https://ergast.com/mrd/) have collated race results between the first F1 race in 1950 and the last race of the 2024 season.

Below I'll go through the approach I took to identify - at least in the data - the F1 GOAT. If you want to skip ahead to the answer, click [here](https://f1-elo.streamlit.app/).

## Method

- Intro to Elo scoring and parameters that can be modified
- Necessary data cleaning
- Measuring accuracy and optimising parameters
- Baseline accuracy
- Applying Elo to multiplayer games - improvement seen
- Applying Elo to asymmetric team games - improvement seen
- Choosing the GOAT

## Output

- Intro to Streamlit
- Visualising results
- Allowing EDA for the fun of it
