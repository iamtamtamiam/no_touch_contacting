# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
log belongs to employee, log belongs to contact
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) 
employee has many contacts through logs; contact has many employee through logs
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) employee has many contacts through logs; contact has many employee through logs
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
Logs has datetime, method, and notes
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
-contact validates name; employee validates username and password; logs validate date
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
contacts/most_frequently_contacte
- [x] Include signup (how e.g. Devise) 
yes employees/new
- [x] Include login (how e.g. Devise) 
yes sessions new
- [x] Include logout (how e.g. Devise)
yes sessions destroy
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
 Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes) 
contact/id/logs; employee/id/logs 
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) 
contact/id/logs/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
activerecord validations on all new; flahs errors also
Confirm:
- [x] The application is pretty DRY
yes
- [x] Limited logic in controllers
yes
- [x] Views use helper methods if appropriate
yes logs 
- [x] Views use partials if appropriate
yes for forms 
