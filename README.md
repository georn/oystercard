# Oystercard [![Build Status](https://travis-ci.org/georn/oystercard.svg?branch=master)](https://travis-ci.org/georn/oystercard) [![Coverage Status](https://coveralls.io/repos/github/georn/oystercard/badge.svg?branch=master)](https://coveralls.io/github/georn/oystercard?branch=master)
**Week 2 Challenge at Makers Academy**

## User Stories

```
1. In order to use public transport,
As a customer,
I want money on my card.

2. In order to keep using public transport,
As a customer,
I want to add money to my card.

3. In order to protect my money,
As a customer,
I don't want to put too much money on my card

4. In order to pay for my journey,
As a customer,
I need my fare deducted from my card.

5. In order to get through the barriers,
As a customer,
I need to touch in and out.

6. In order to pay for my journey,
As a customer,
I need to have the minimum amount for a single journey.

7. In order to pay for my journey,
As a customer,
I need to pay for my journey when it's complete.

8. In order to pay for my journey,
As a customer,
I need to know where I've travelled from.

9. In order to know where I have been,
As a customer,
I need to see all my previous trips.

10. In order to know how far I have travelled,
As a customer,
I want to know what zone a station is in.

10. In order to be charged correctly,
As a customer,
I need a penalty charge deducted if I fail to touch in or out

11. In order to be charged the correct amount,
As a customer,
I need to have the correct fare calculated.
```

## Quickstart

* Clone the repository and change directory inside of it by using the following command lines:

```
git clone git@github.com:georn/oystercard.git
cd oystercard
```

Then you can run the test suite using:
```
# Install dependencies
bundle Install

# Run the test suite (rspec)
rspec
```

## TODO

- [x] Oystercard has a balance.
- [x] Oystercard can be top up.
- [x] Oystercard have a top limit.
- [x] Oystercard balance gets can be deducted.
- [x] Oystercard can touch in Station(s).
- [x] Oystercard can touch out Station(s).
- [x] Oystercard does have a minimum fare.
- [ ] Oystercard can't touch in without minimum fare on balance.
- [x] Oystercard deducts fare from balance when touch out from a station.
- [x] Oystercard tracks the current and previous journeys.
- [x] Station has a zone and it can be read.
- [ ] Penalty fare is charged if card is not touch in or out.
- [ ] Correct fare is calculated when completing a journey.

## Collaborators
This amazing people collaborated to the code, but by that time I wasn't a good git collaborator. Thus, it is now when they have their credits.

* [Simon Ashbery](https://github.com/SiAshbery)
* [Daniele Lixi](https://github.com/y0m0)
* [Elena Morton](https://github.com/elenamorton)
* [Roland Grenke](https://github.com/rogrenke)
