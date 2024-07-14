---
title: "Who is the F1 GOAT?"
description: "Using data to identify the F1 greatest of all time."
date: 2024-07-15T15:00:00
tags: ["python", "f1", "rating-system", "streamlit"]
math: True
weight: 10
---

## Context

I'm a big F1 fan. I've played too many hours of multiple F1 games and there's nothing I like more on a race day than turning on the TV, butchering an impersonation of the theme tune and feeling a wave of anxiety rush over me minutes before the start of a race that has no bearing on my personal life.

Recently for the n-hundredth time, I overheard the classic F1 debate about which driver is the greatest of all time (GOAT). There are many opinions, typically based on a mix of on-track and off-track actions. Fortunately, the folks over at [Ergast](https://ergast.com/mrd/) have collated race results between the first F1 race in 1950 and the last race of the 2024 season.

Below I'll go through the approach I took to identify - at least in the data - the F1 GOAT. If you want to skip ahead to the answer, click [here](https://f1-elo.streamlit.app/). I did put effort into this though, so my feelings will be hurt.

## Method

### Necessary data cleaning

Before the fun part starts, there's always data cleaning. Simplifying assumptions that were made for this were:

1. A driver who finishes ranks above a non-finishing driver (Mitch, that's so obvious). The N non-finishing drivers are then ranked by their qualifying order (the bit that needed clarifying).
2. If a car for a race had multiple drivers, each driver is treated like they individually raced the car (this was a pre-1985 thing).
3. The 2024 point system is used for all races, minus the fastest lap point, based on the modified finishing positions.
4. There are only 3 reasons for a retirement: driver-led, constructor-led, and misc - where no party can be blamed. Spoiler, I use these later.

### Intro to rating systems

The current best way to understand the relative skill levels of players is through a rating system. A player rated 2500 in theory has a higher probability of beating a 500-rated player than a 2000-rated player, but how do you calculate these numbers? Turns out there are many ways but the [Elo rating system](https://en.wikipedia.org/wiki/Elo_rating_system) and derivations of it have been most commonly used since its introduction to Chess in the 1960s, branching out to many sports and esports since.

Ratings have a starting value $R_0$ for all players, with rating changes for every game $n$ ($n \in [1, 2, ...]$) based on the difference between the expected result $e$ of a match between players $i$ and $j$ vs the actual result $a$ (0 being a loss, 1 being a win). Tweaking this for F1 as a multiplayer game with $d$ players (where $d \in [1, 2, y_d]$ and $y_d$ is the number of drivers racing in year $y$) you get:

$$
  R_{n, i} = R_{n-1, i} + K \left( \sum_{d=1, d \neq i}^{d_y} e_{n, i, d} - a_{n, i, d} \right)
$$

Note, this also ignores where drivers race in the same cars. $K$ is the scalar applied to any difference between $e$ and $a$ per match, but $e$ is where the magic happens as it determines the degree to which a difference in the expected vs actual results causes a change in the rating and this is where the rest of the project focusses.

### Evaluating accuracy

To improve the estimate of $e$, you need to understand the accuracy of the rating system for each $e$ vs $a$. Given this system is modelling the probability of a win, root of the [Brier score](https://en.wikipedia.org/wiki/Brier_score) can be used to measure this in an easy-to-understand way as it can be seen as the mean error of predicting a win.

To define ROI on any model tweaks lets define the easiest baseline model, that every race result is a random guess and expected results are based on this. Simulating this 5 times yields a mean error of 0.7075.

## Predicting the expected outcome

The Elo rating system assumes...

## Choosing the GOAT

## Output



# Background

# Challenge

1. F1 is a multi-person sport where teams have unequal performance (e.g. 10 2-person teams in 2024) meaning a low-rated driver in a high-rated team can race against a high-rated driver in a low-rated team. Creating a rating system that can separate the two is necessary.
2. A driver can retire from a race due to a driver or constructor-led reason, and should effect their respective ratings dependent on the retirement reason.

# Formula

$r'_c$ and $r'_d$ are the ratings of a constructor and driver prior to a race, starting at 1500 if they have not entered a race before. $r'_{c, d} = wr'_c + r'_d$ is a constructor-driver combined rating where $w \in \R^+$ is a scalar value applied to the constructor's rating and, for simplicity, a combination $(c, d)$ will be relabelled as $i$ from here on. 


Upon completion of the next race where $N$ combinations participate, the change in rating of a combination can be calculated as: 

$$
    c_i = \frac{k(o_i - e_i)}{N-1}
$$

where $k \in \R^+$ is a scalar of the difference between $o_i$, the true outcome for the completed race, and $e_i$ the expected outcome, formula for which are below:

$$
    \begin{align*}
        o_i &= \sum^N_{j=1, i \ne j} I_{i, j} \\
        I_{i, j} &= \begin{cases} 
            1 & \text{if \( i \) positions higher than \( j \)} \\ 
            0 & \text{if \( i \) positions higher than \( j \)} 
        \end{cases} \\
        e_i &= \sum^N_{j=1, i \ne j} \frac{1}{1 + e^{-R'_{i, j} / s}} \\
        R'_{i, j} &= r'_i - r'_j
    \end{align*}
$$

$s$ is scalar of the influence of rating differences on probability for combination $i$ to beat combination $j$.


# Results
# Improvements

