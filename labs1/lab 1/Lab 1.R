#Stats 133 Lab 1

scored <- c(14, 14, 9, 14, 28, 13, 13, 24, 17, 6, 24, 0, 24, 13, 26, 14)
against <- c(19, 30, 16, 38, 31, 24, 23, 30, 41, 13, 20, 52, 13, 31, 24, 47)

# 1) How many points did the Raiders score in game 7?
scored [7]

# 2) What was the score of the first 5 games?
scored[c(1,2,3,4,5)]

# 3) What were the scores of the even games? Try to do this problem without typing in c(2,4,…)
scored[seq(from=2, to=length(scored), by=2)]

# 4) What was the score of the last game? Try to do this problem without typing in the number of the last game.
scored[length(scored)]

# 5) Select the scores higher than 14.
scored [scored > 14]

# 6) Select the scores equal to 14.
scored [scored = 14]

# 7) Select the scores equal to 13 or 14.

scored [scored == 13 | scored == 14]

# 8) Select the scores between between 7 and 21 points.

scored [scored > 7 & scored < 21]

# 9) Sort the scores in decreasing order.

scored [seq (from = max(scored), to = min(scored))]

# 10) What was the highest score achieved?
max(scored)

# 11) What was the lowest score achieved?
min(scored)

# 12) What was the average score?
mean(scored)

# 13) Use the summary() function to give some summary statistics.
summary(scored)

# 14) In how many games did the Raiders score over 20 points?

length(scored[scored > 20])

# LAB PART 2

# 1) What was the sum of the scores in game 7?
scored[7] + against [7]

# 2) What was the sum of the scores in the last 5 games?

sum(scored [seq(from = length(scored) - 5, to = length(scored), by = 1)])

# 3) What was the difference in scores in the odd games?

scored[seq(from = 1, to = length(scored) -1, by = 2)] - against[seq(from = 1, to =length(against) - 1, by = 2)]

# 4) Which games did the Raiders win?

scored > against

# 5) Were there any ties?

scored == against


