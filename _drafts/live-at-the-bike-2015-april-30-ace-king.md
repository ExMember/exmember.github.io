---
title: Ace-Queen Facing a Three-Bet on Live at the Bike
category: poker
tags:
  - hand analysis
  - Live at the Bike
---

# Background

I'm in a no-limit hold'em cash game with $5 blinds and an allowed buy-in of $300
to $1000 dollars.

The game is broadcast on Live at the Bike so if you have a subscription you can
watch this hand play out in the archives. It's from the April 30, 2015 show and
starts one hour and fifty-one minutes in.

# The action

The first player folds. I am second to act and have `AcQd` and about $1600 in my
stack. I raise to $25.

Everyone folds to the small blind, Paul, who re-raises to $65. He has $325 left
in his stack.

The big blind folds, but I call the $40. There is $130 in the pot.

The flop comes `QhJd6c`. Paul bets $100. I call. There is $330 in the pot.

The turn is an `8c`. Paul goes all-in for $225. I call.

Paul shows `KcKd` but the river is an `Ah` and I scoop the $779 pot.

# Committed

In this hand I have ace-queen on a queen-high board and an effective
stack-to-pot ratio of 2.5. That seems very much like a hand we'd like to commit
our entire stack with.

But there are a lot of reasons to think Paul has a very tight range here, and
if it's tight enough I should be folding.

# Paul's range

Paul re-raised me from out of the blinds. I think he has a very typical
three-bet range for this game, very tight and with no hands that don't have a
lot of showdown value.

When we consider the other factors; the initial raiser (me) is in early
position, we are heads-up, stacks are shallow, and he is out of position, and
it's pretty clear Paul is only raising for value and is probably has a very
tight range.

A good estimate of that range would be `JJ+` and `AK`. `TT` is a possibility but
I think it's very unlikely. I would entertain arguments to add `AQs` or remove
`AK`.

Let's estimate Paul's range as `JJ` (6 permutations), `QQ` (3 permutations),
`KK` (6 permutations), `AA` (3 permutations), `AK` (12 permutations).

I'm way behind this range, so what could justify calling here?

# The two scenarios

I'm going put all of Paul's hands on the flop into two broad categories,
top-pair or better and less than top-pair. My premise is that Paul will
bet the first set of flops, and check-fold to a $75 bet on the second set.

If I'm wrong about this assumption things change, but we'll talk about that
later.

# Check-folds

Given the range we assigned Paul earlier, he has `AK` 40% of the time, (\' 12/30
\'), `JJ` 20% of the time (\`9/30\`), `QQ` 10% of the time (\`3/30\`), `KK` 20%
of the time (\`6/30\`) and `AA` 10% of the time (\`3/30\`).

## Ace-king

When Paul has `AK` there are two aces and three kings left out of 48 unknown
cards. The odds of none of those five cards hitting the flop is \` 43/48 * 42/47
* 41/46 \` or 71.4%.

There is also the chance that he flops a straight, but we'll save that
complication for later.

## Jacks

When Paul has `JJ` there are three aces, four kings, and three queens left. The
odds of none of these ten cards coming on the flop are \` 38/48 * 37/47 * 36/46
\` or 48.8%. The probability of at least one of these over-cards hitting is
51.2%.

## Queens

When Paul has `QQ` there are only seven over-cards left so the math works out to
\` 41/48 * 40/47 * 39/46 \`. That's a 61.6% chance of none of those cards
hitting so at least one of them will hit 38.4% of the time.

## Kings

When Paul has `KK` there are only three over-cards left. The probability of none
of them coming on the flop is \` 45/48 * 44/47 * 43/46 \` or 82.0%. The probably
of at least one is 18.0%.

## Aces

When Paul has `AA` we can be certain the flop won't bring any over-cards

All together, Paul has `AK` 40.0% of the time and check-folds it 71.4% of the
time, he has `JJ` 20.0% of the time and folds it 51.2% of the time, `QQ` 10.0%
of the time and check-folds it `38.4%` of the time, and `KK` 20.0% of the time
and check-folds that 18.0%. In total Paul is check-folding the flop \` (.400 *
.714) + (.200 * .512) + (.100 * .384) + (.200 * .180) \` or 46.2%.

# Value from check-folds

Pre-flop I have to call a $40 re-raise to see the flop. On the flop I am going
to win the $130 pot 46.2% of the time, for an expected value of $60, a $20
profit.

It's especially interesting to notice that this play is profitable no matter
what my cards are. In fact it's even more profitable if I hold `27o`because
there are now more flops that look scary to Paul and flops that don't look
scary that I can stack him with. 

# Bonus value

## Monotone flops

A monotone flop could provide me extra value in two ways. Fear of a flush could
help convince Paul to fold hands he wouldn't otherwise. Clubs and diamonds would
also give my hand a lot more showdown equity, which is valuable presuming I am
less likely to go broke with a second-best flush than Paul.

But monotone flops make up about 5% of all flops so this is probably not a
significant factor.

## Monster flop

There are a couple of flops, specifically `KJT` and `AQX`, that give me the
effective nuts, but at the same time are very likely to give Paul a worse hand
that he would still be willing to get all in with.

Specifically, a flop of `KJT` against Paul's `KK`, `JJ`, or `TT` or `AQX`
against Paul's `AK` both put me in a very good position.

In contrast, as long as I avoid getting all-in with one-pair, flops where I get
all in as a big dog are much less likely.

# Negative value

## Hitting the flop

## Check-raises

## Check-calls

## Continuation bets

## A tighter range for Paul

What happens if we take `AK` out of Paul's range? It's possible he wouldn't
three-bet with that hand, so how should that change my play?

With out `AK` Paul's range is `JJ` (6 permutations), `QQ` (3 permutations),
`KK` (6 permutations), `AA` (3 permutations).

Let's continue with the assumption that Paul bets the flop every time with
top-pair or better and check-folds with anything worse.

Given the range of hands I estimate Paul could have, and the way I expect him to
play those hands, calling pre-flop looks to be profitable. But if I'm wrong this
hand could be disastrously bad.

Even worse, it's possible Paul is never three-betting pre-flop with `AK` or
worse. In that case, even if he bets everything top-pair or better and
check-folds to everything else, I still lose money calling pre-flop.

# Conclusion
