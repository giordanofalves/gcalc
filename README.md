# Gcalc
A little project to show a simulate a calculator.

* Ruby version: 2.4.0
* Rails version: 5.2.1

## Synopsis
I created this project to a job test.
You can access this project here: [add link](add link)

My goals are:

* A beautiful code
* Min 95% code covered by specs
* Use great tools like Travis CI, Code Climate and SimpleCov
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
cp config/credentials.yml.example config/credentials.yml.enc (nedd to check if will use credentials to it)
bundle install
```
Update your database credentials in credentials.yml.enc.


## Test suite
```console
rspec ./spec
```