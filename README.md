# README

This README documents the steps necessary to get the application up and running.

## Ruby Version

* Ruby version: 3.2.1

## System Dependencies

* Node Version Manager (NVM): 16.15.1
* PostgreSQL database

## Configuration

* No additional configuration required

## Database Creation

* Run `rails db:create` to create the database

## Database Initialization

* Run `rails db:migrate` to initialize the database
* Run `rails db:seed` to load seed data (includes a default teacher account)

## Services

* No additional services required

## Deployment Instructions

* No deployment instructions provided

## Additional Information

* This application uses PostgreSQL as the database
* NVM is used to manage Node.js versions
* A default teacher account is created with the email "teacher@gmail.com" and password "123456" when running `rails db:seed`