## Trademob Rails Assignment

The application can be setup in the development environment by using the following steps:

1. `git clone <your fork>`
2. `bundle install`
3. `rake db:migrate`
4. `rake db:seed`
5. `rails s`

### Understanding and thoughts

I would like to say that I had covered all the functionality according to the understading of the assignment requirements. In this stage, the design portion of the UI and the look and feel is not taken into consideration. The application also have some default settings of ActiveAdmin.

### Implementation

 Used the `gem cancan` for the authorization. It is used for assigning the Admin and Campaign manager role to the Admin user.

 