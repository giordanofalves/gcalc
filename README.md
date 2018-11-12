# Gcalc
A little project to simulate a calculator.
[![Maintainability](https://api.codeclimate.com/v1/badges/da7fdc93b494c7ed98fd/maintainability)](https://codeclimate.com/github/giordanofalves/gcalc/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/da7fdc93b494c7ed98fd/test_coverage)](https://codeclimate.com/github/giordanofalves/gcalc/test_coverage)
[![Build Status](https://travis-ci.org/giordanofalves/gcalc.svg?branch=master)](https://travis-ci.org/giordanofalves/gcalc)

* Ruby version: 2.4.0
* Rails version: 5.2.1

## Synopsis
I created this project to a job test.
You can access this project here: [https://g-calc.herokuapp.com/](https://g-calc.herokuapp.com/)

My goals are:

* A beautiful code
* Min 95% code covered by specs
* Use great tools like:
    * Travis CI;
    * Code Climate;
    * SimpleCov;
    * Rubocop;
    * Bullet;
* A good layout(my weakness)
* Publish this project in heroku server
* Calculator page(using ActionCable)
* An calculator interface that:
  * Showing two inputs to receive values to calculate
  * Actions to the four basic operations:
    * Sum;
    * Difference;
    * Multiplication;
    * Division;

## Installing

```console
git clone https://github.com/giordanofalves/gcalc.git
cp config/database.yml.travis config/database.yml (need to change database credentials here)
bundle install
```

## Test suite
```console
rspec ./spec
```
