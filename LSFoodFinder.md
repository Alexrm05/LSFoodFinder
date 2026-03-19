# LSFoodFinder
CA1 for Web Projects II (2025-2026)

Important note: this graded exercise must be done individually.

Between assignments, exams, and project deadlines, finding time to plan and cook meals can be a challenge. That’s where LSFoodFinder comes in.

Welcome to LSFoodFinder, where you will build a PHP web application that allows users to search for recipes using an external API, explore detailed cooking instructions, save their favorite dishes, and share them with other users of the platform. Get ready to mix backend logic with API integration — and cook up something great!

## Pre-requisites and requirements

To be able to create this web app, you are going to need a local environment suited with:

1. Web server (Nginx)
2. PHP 8
3. MySQL
4. Composer

You have to use the Docker `local-environment` set up that we have been using in class. It should be enough for your needs.

## Resources

### MySQL

Use the [schema.sql](./resources/schema.sql "Schema SQL") provided as part of this exercise to create the tables in the MySQL database.

### Guzzle

You will need to request information from an external API during the exercise. You MUST use [Guzzle](https://docs.guzzlephp.org/en/stable/).

## Exercise

To complete the exercise, you will need to create five different pages:

1. Register
2. Login
3. Search
4. Recipe
5. Favorites

### Register

For this page, you have to create a file called `register.php` that displays a register form containing two fields:

1. Email - must be a valid email
2. Password - must contain at least one number, one capital letter, and should be longer than or equal to 9 characters

When the form is submitted, you need to validate the data from the form. All the validation errors must be displayed under the corresponding input field.
If the registration is successful, you need to [(HTTP) redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections) the user to the login page.

### Login

For this page, you have to create a file called `login.php` that is going to display a login form containing two fields:

1. Email
2. Password

When the form is submitted, you need to validate the data from the form. The email must have a valid format and both fields must not be empty. All the validation errors must be displayed under the corresponding input field.

If all the data is correct, you will have to check if the user exists in the database to log him in (**you need to start a session for the user**).If the credentials are incorrect (either the email does not exist or the password is wrong), you need to display a generic error message, such as: **Invalid credentials**.

You must not indicate whether the email exists or whether the password is incorrect, in order to avoid giving information to potential attackers.

If the login is successful, you must redirect the user to **search.php**.

### Search

If users try to manually access to this page without being logged in, they should be redirected to the login page.

For this page, you have to create a file called `search.php` that is going to display a search form containing just one input field where the user will enter the name of a recipe or an ingredient.

Once the form is submitted, you will have to do an **API call** to the [Spoonacular API](https://spoonacular.com/food-api/docs) to search for recipes matching the given keyword.

After receiving the response, you will have to display the results of the query **in the form of a grid of recipe cards**. This means that the recipes should not be shown in "list form", but more like in a structured gallery layout.

Each recipe card must display at least:

- The recipe image  
- The recipe title  
- A link or button to access the detailed view of the recipe  

```
$apiUrl = "https://api.spoonacular.com/recipes/complexSearch?query=$keyword"
```

Notice that `$keyword` corresponds to the text entered by the user in the search input.

To use the **Spoonacular API**, first you need to create a free account on their website and generate an API key. You will use this API key to make the calls to the *Search Recipes* endpoint:

https://api.spoonacular.com/recipes/complexSearch

For authentication, you must include your API key as a request parameter. For more information, check the official documentation.

Optionally, you may limit the number of results returned by the API (for example, showing only up to 10 recipes) by experimenting with the available request parameters in the documentation.

### Recipe

If users try to manually access to this page without being logged in, they should be redirected to the login page.

For this page, you have to create a file called `recipe.php` that displays the detailed information of a selected recipe.

When the user clicks on a recipe from the Search page, they should be redirected to this page. The recipe identifier must be passed through the URL in order to retrieve the full recipe information.

For example:

```
recipe.php?id=716429
```

In this case, `716429` would correspond to the ID of the selected recipe returned by the Spoonacular API.

On this page, you will have to perform an **API call** to the [Spoonacular API](https://spoonacular.com/food-api/docs) to obtain the detailed information of the selected recipe.

The page must display at least:

- The recipe title  
- The recipe image  
- The list of ingredients  
- The cooking instructions  

```
$apiUrl = "https://api.spoonacular.com/recipes/$id/information"
```

Notice that `$id` corresponds to the identifier of the selected recipe.

To retrieve the detailed information, you must use the *Get Recipe Information* endpoint:

https://api.spoonacular.com/recipes/{id}/information

Additionally, this page must include a button that allows the user to add or remove the recipe from their list of favorites. The favorite recipes must be stored in the database and associated with the logged-in user.

### Favorites

If users try to manually access to this page without being logged in, they should be redirected to the login page.

For this page, you have to create a file called `favorites.php` that displays all the recipes that have been marked as favorites by the logged-in user.

The favorite recipes must be retrieved from the database and must only display the recipes associated with the current user.

The page must show the favorite recipes in the form of a **grid of recipe cards**, similar to the Search page. Each card must display at least:

- The recipe image  
- The recipe title  
- A link or button to access the detailed view of the recipe  

Additionally, the user must be able to remove a recipe from their list of favorites directly from this page.

If the user has not added any favorite recipes yet, a message should be displayed indicating that no favorite recipes have been saved.

### Logout

A logout functionality must be implemented.

When the user logs out, the current session must be completely destroyed and the user must be redirected to the login page.

After logging out, the user must not be able to access any authenticated pages (search.php, recipe.php, or favorites.php) unless they log in again. If the user tries to manually access any of these pages, they must be redirected to the login page.

A visible “Logout” link or button must be available in all authenticated pages.

## Delivery

### Requirements

Besides using Guzzle, you MUST use the structures available in Object-Oriented Programming, at least classes and objects.

### Format

You must upload a .zip file with the filename format `AC1_<your_login>.zip` containing all the code to the eStudy.
