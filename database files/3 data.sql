-- SM WOW! Excellent! 100%
USE HeartyHearth
GO

DELETE CookBookRecipe
DELETE CookBook
DELETE MealCourseRecipe
DELETE MealCourse
DELETE Meal
DELETE Direction
DELETE RecipeIngredient
DELETE Recipe
DELETE Cuisine
DELETE Course
DELETE Measurement
DELETE Ingredient
DELETE RUser
GO


INSERT RUser(FirstName, LastName, UserName)
SELECT 'Ezra', 'Carson', 'ECarson'
UNION SELECT 'Oliver', 'Oudson', 'EHudson'
UNION SELECT 'Shmiel', 'Breuer', 'SBreuer'
UNION SELECT 'John', 'Smith', 'JSmith'
GO

INSERT Ingredient(IngredientDesc)
SELECT 'sugar'
UNION SELECT 'oil'
UNION SELECT 'eggs'
UNION SELECT 'vanilla sugar'
UNION SELECT 'baking powder'
UNION SELECT 'baking soda'
UNION SELECT 'chocolate chips'
UNION SELECT 'granny smith apples'
UNION SELECT 'vanilla yogurt'
UNION SELECT 'orange juice'
UNION SELECT 'honey'
UNION SELECT 'ice cubes'
UNION SELECT 'club bread'
UNION SELECT 'butter'
UNION SELECT 'shredded cheese'
UNION SELECT 'garlic (crushed)'
UNION SELECT 'black pepper'
UNION SELECT 'salt'
UNION SELECT 'vanilla pudding'
UNION SELECT 'whipped cream cheese'
UNION SELECT 'sour cream cheese'
UNION SELECT 'flour'
UNION SELECT 'Pizza dough'
UNION SELECT 'Extra virgin olive oil'
UNION SELECT 'Italian seasoning'
UNION SELECT 'Garlic powder'
UNION SELECT 'Shredded cheese'
UNION SELECT 'Wrap'
UNION SELECT 'salsa'
UNION SELECT 'avocado'
UNION SELECT 'Plain greek yogurt'
UNION SELECT 'Lime'
UNION SELECT 'Pizza sauce'
UNION SELECT 'Scallions'
UNION SELECT 'Chopped parsley'
UNION SELECT 'Basil leaves'
GO

INSERT Measurement(MeasurementDesc)
SELECT 'cup'
UNION SELECT 'tsp'
UNION SELECT 'unit'
UNION SELECT 'tbsp'
UNION SELECT 'oz'
UNION SELECT 'cloves'
UNION SELECT 'pinch'
UNION SELECT 'stick'
UNION SELECT 'lb'
GO

INSERT Course(CourseDesc, CourseOrder)
SELECT 'Main course', 3
UNION SELECT 'Appetizer', 2
UNION SELECT 'dessert', 4
UNION SELECT 'hors d''oeuvre', 1
GO

INSERT Cuisine(CuisineDesc)
SELECT 'American'
UNION SELECT 'French'
UNION SELECT 'English'
UNION SELECT 'Mexican'
GO

;
WITH x AS(

    SELECT Cuisine = 'American', userFN = 'Ezra', RecipeName = 'Chocolate Chip Cookies', Calories = 25, DraftDate = '2022-11-10', PublishDate = '2022-11-12', ArchiveDate = NULL
    UNION SELECT 'French', 'Ezra', 'Apple Yogurt Smoothie', 48, '2022-11-10', '2022-11-12', NULL
    UNION SELECT 'English', 'Oliver', 'Butter Muffins', 64, '2022-11-10', '2022-11-12', '2022-11-14'
    UNION SELECT 'English', 'Oliver', 'Cheese Bread', 31, '2022-10-10', '2022-11-12', NULL
    UNION SELECT 'American', 'Shmiel', 'Cheesy Sticks', 100, '2022-11-12', '2022-11-15', NULL
    UNION SELECT 'Mexican', 'Shmiel', 'Mexican Pizza', 100, '2021-11-12', null, NULL
    UNION SELECT 'French', 'Shmiel', 'Herby Pizza', 100, '2022-11-13', '2022-11-15', NULL
    UNION SELECT 'French', 'Shmiel', 'Herbs Pizza', 100, '2022-11-13', NULL, '2022-11-15'
)
INSERT Recipe(CuisineID, RUserID, RecipeName, Calories, DraftDate, PublishDate, ArchiveDate)
SELECT c.CuisineID, u.RUserID, x.RecipeName, x.Calories, x.DraftDate, x.PublishDate, x.ArchiveDate
FROM x
JOIN RUser u
ON x.userFN = u.FirstName
JOIN Cuisine c
ON c.CuisineDesc = x.Cuisine
GO

;

WITH x AS(
    SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'sugar', Measurement = 'cup', Amount = 1, IngredientOrder = 1
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'oil', Measurement = 'cup', Amount = 0.5, IngredientOrder = 2
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'eggs', Measurement = 'unit', Amount = 3, IngredientOrder = 3
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'Flour', Measurement = 'cup', Amount = 2, IngredientOrder = 4
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'vanilla sugar', Measurement = 'tsp', Amount = 1, IngredientOrder = 5
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'baking powder', Measurement = 'tsp', Amount = 2, IngredientOrder = 6
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'baking soda', Measurement = 'tsp', Amount = 0.5, IngredientOrder = 7
    UNION SELECT Recipe = 'Chocolate Chip Cookies', Ingredient = 'chocolate chips', Measurement = 'cup', Amount = 1, IngredientOrder = 8

    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'granny smith apples', Measurement = 'unit', Amount = 3, IngredientOrder = 1
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'vanilla yogurt', Measurement = 'cup', Amount = 2, IngredientOrder = 2
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'sugar', Measurement = 'tsp', Amount = 2, IngredientOrder = 3
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'orange juice', Measurement = 'cup', Amount = 0.5, IngredientOrder = 4
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'honey', Measurement = 'tbsp', Amount = 2, IngredientOrder = 5
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', Ingredient = 'ice cubes', Measurement = 'unit', Amount = 5.5, IngredientOrder = 6

    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'club bread', Measurement = 'unit', Amount = 1, IngredientOrder = 1
    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'butter', Measurement = 'oz', Amount = 4, IngredientOrder = 2
    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'shredded cheese', Measurement = 'oz', Amount = 8, IngredientOrder = 3
    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'garlic (crushed)', Measurement = 'cloves', Amount = 2, IngredientOrder = 4
    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'black pepper', Measurement = 'tsp', Amount = 0.25, IngredientOrder = 5
    UNION SELECT Recipe = 'Cheese Bread', Ingredient = 'salt', Measurement = 'pinch', Amount = 1, IngredientOrder = 6
    
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'butter', Measurement = 'stick', Amount = 1, IngredientOrder = 1
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'sugar', Measurement = 'cup', Amount = 3, IngredientOrder = 2
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'vanilla pudding', Measurement = 'tbsp', Amount = 2, IngredientOrder = 3
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'eggs', Measurement = 'unit', Amount = 4, IngredientOrder = 4
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'whipped cream cheese', Measurement = 'oz', Amount = 8, IngredientOrder = 5
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'sour cream cheese', Measurement = 'oz', Amount = 8, IngredientOrder = 6
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'flour', Measurement = 'cup', Amount = 1, IngredientOrder = 7
    UNION SELECT Recipe = 'Butter Muffins', Ingredient = 'baking powder', Measurement = 'tsp', Amount = 2, IngredientOrder = 8

    UNION SELECT Recipe = 'Cheesy Sticks', Ingredient = 'Pizza dough', Measurement = 'lb', Amount = 1.5, IngredientOrder = 1
    UNION SELECT Recipe = 'Cheesy Sticks', Ingredient = 'Extra virgin olive oil', Measurement = 'tbsp', Amount = 6, IngredientOrder = 2
    UNION SELECT Recipe = 'Cheesy Sticks', Ingredient = 'Italian seasoning', Measurement = 'tsp', Amount = 3, IngredientOrder = 3
    UNION SELECT Recipe = 'Cheesy Sticks', Ingredient = 'Garlic powder', Measurement = 'tsp', Amount = 0.75, IngredientOrder = 4
    UNION SELECT Recipe = 'Cheesy Sticks', Ingredient = 'Shredded cheese', Measurement = 'cup', Amount = 2, IngredientOrder = 5

    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'Wrap', Measurement = 'unit', Amount = 1, IngredientOrder = 1
    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'salsa', Measurement = 'cup', Amount = .25, IngredientOrder = 2
    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'Shredded cheese', Measurement = 'oz', Amount = 1.5, IngredientOrder = 3
    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'avocado', Measurement = 'unit', Amount = 0.5, IngredientOrder = 4
    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'Plain greek yogurt', Measurement = 'cup', Amount = 0.25, IngredientOrder = 5
    UNION SELECT Recipe = 'Mexican Pizza', Ingredient = 'Lime', Measurement = 'cup', Amount = 0.5, IngredientOrder = 6

    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Wrap', Measurement = 'unit', Amount = 2, IngredientOrder = 1
    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Pizza sauce', Measurement = 'cup', Amount = 0.5, IngredientOrder = 2
    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Shredded cheese', Measurement = 'cup', Amount = 0.75, IngredientOrder = 3
    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Scallions', Measurement = 'unit', Amount = 2, IngredientOrder = 4
    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Chopped parsley', Measurement = 'cup', Amount = 0.25, IngredientOrder = 5
    UNION SELECT Recipe = 'Herby Pizza', Ingredient = 'Basil leaves', Measurement = 'unit', Amount = 7, IngredientOrder = 6

)
INSERT RecipeIngredient(RUserID, RecipeID, IngredientID, MeasurementID, Amount, RecipeIngredientOrder)
SELECT r.RUserID, r.RecipeID, i.IngredientID, m.MeasurementID, x.Amount, x.IngredientOrder
FROM x
JOIN Recipe r
ON x.Recipe = r.RecipeName
join Ingredient i
on x.Ingredient = i.IngredientDesc
JOIN Measurement m
ON x.Measurement = m.MeasurementDesc
GO

;
WITH x AS(
    SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'First combine sugar, oil and eggs in a bowl', DirectionOrder = 1
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'mix well', DirectionOrder = 2
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'add flour, vanilla sugar, baking powder and baking soda', DirectionOrder = 3
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'beat for 5 minutes', DirectionOrder = 4
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'add chocolate chips', DirectionOrder = 5
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'freeze for 1-2 hours', DirectionOrder = 6
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'roll into balls and place spread out on a cookie sheet', DirectionOrder = 7
    UNION SELECT Recipe = 'Chocolate Chip Cookies', StepDesc = 'bake on 350 for 10 min', DirectionOrder = 8

    UNION SELECT Recipe = 'Apple Yogurt Smoothie', StepDesc = 'Peel the apples and dice', DirectionOrder = 1
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', StepDesc = 'Combine all ingredients in bowl except for apples and ice cubes', DirectionOrder = 2
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', StepDesc = 'mix until smooth', DirectionOrder = 3
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', StepDesc = 'add apples and ice cubes', DirectionOrder = 4
    UNION SELECT Recipe = 'Apple Yogurt Smoothie', StepDesc = 'pour into glasses', DirectionOrder = 5

    UNION SELECT Recipe = 'Cheese Bread', StepDesc = 'Slit bread every 3/4 inch', DirectionOrder = 1
    UNION SELECT Recipe = 'Cheese Bread', StepDesc = 'Combine all ingredients in bowl', DirectionOrder = 2
    UNION SELECT Recipe = 'Cheese Bread', StepDesc = 'fill slits with cheese mixture', DirectionOrder = 3
    UNION SELECT Recipe = 'Cheese Bread', StepDesc = 'wrap bread into a foil and bake for 30 minutes', DirectionOrder = 4

    UNION SELECT Recipe = 'Butter Muffins', StepDesc = 'Cream butter with sugars', DirectionOrder = 1
    UNION SELECT Recipe = 'Butter Muffins', StepDesc = 'Add eggs and mix well', DirectionOrder = 2
    UNION SELECT Recipe = 'Butter Muffins', StepDesc = 'Slowly add rest of ingredients and mix well', DirectionOrder = 3
    UNION SELECT Recipe = 'Butter Muffins', StepDesc = 'fill muffin pans 3/4 full and bake for 30 minutes.', DirectionOrder = 4

    UNION SELECT Recipe = 'Cheesy Sticks', StepDesc = 'Preheat overn to 425°f', DirectionOrder = 1
    UNION SELECT Recipe = 'Cheesy Sticks', StepDesc = 'Drizzel 3 tablespoons olive oil on a piece of parchment paper. Sprinkle with Italian seasoning and garlic powder.', DirectionOrder = 2
    UNION SELECT Recipe = 'Cheesy Sticks', StepDesc = 'Drizzle remaining 3 tablespoons olive oil over the suface of the dough, then scatter the cheese evenly over the top.', DirectionOrder = 3
    UNION SELECT Recipe = 'Cheesy Sticks', StepDesc = 'Bake for 20-25 minutes, or until crust is deep golden brown and the cheese is fully melted, bubbly, and browned in places', DirectionOrder = 4
    UNION SELECT Recipe = 'Cheesy Sticks', StepDesc = 'Cut into strips. Serve with Rotev Pizza.', DirectionOrder = 5

    UNION SELECT Recipe = 'Mexican Pizza', StepDesc = 'Preheat overn to 425°f', DirectionOrder = 1
    UNION SELECT Recipe = 'Mexican Pizza', StepDesc = 'Spread wraps with salsa and cheese.', DirectionOrder = 2
    UNION SELECT Recipe = 'Mexican Pizza', StepDesc = 'After removing from oven, slice pizza. Top with avocado. Combine yogurt and lime; drizzel over pizza before serving.', DirectionOrder = 3

    UNION SELECT Recipe = 'Herby Pizza', StepDesc = 'Preheat overn to 425°f', DirectionOrder = 1
    UNION SELECT Recipe = 'Herby Pizza', StepDesc = 'Spread wraps with sauce and cheese. Bake for 9-12 minutes.', DirectionOrder = 2
    UNION SELECT Recipe = 'Herby Pizza', StepDesc = 'Top with Scallions, parsley, and Basil; slice pizza to serve.', DirectionOrder = 3
)
INSERT Direction(RUserID, RecipeID, StepDesc, DirectionOrder)
SELECT r.RUserID, r.RecipeID, x.StepDesc, x.DirectionOrder
FROM x
JOIN Recipe r
ON x.Recipe = r.RecipeName
GO


;
WITH x AS(
    SELECT userFN = 'Oliver', MealName = 'Breakfast bash'
    UNION SELECT userFN = 'Shmiel', MealName = 'Pizza party'
)
INSERT Meal(RUserID, MealName)
SELECT u.RUserID, x.MealName
FROM x
JOIN RUser u
ON x.userFN = u.FirstName

;
WITH x as(
    SELECT Meal = 'Breakfast bash', Course = 'Main course'
    UNION SELECT Meal = 'Breakfast bash', Course = 'Appetizer'

    UNION SELECT Meal = 'Pizza party', Course = 'Main course'
)
INSERT MealCourse(MealID, CourseID, RUserID)
SELECT m.MealID, c.CourseID, m.RUserID
FROM x
JOIN Course c
ON x.Course = c.CourseDesc
JOIN Meal m
ON x.Meal = m.MealName
GO



;
WITH x AS(
    SELECT Meal = 'Breakfast bash', Course = 'Main course', Recipe = 'Cheese Bread', Main = 1
    UNION SELECT Meal = 'Breakfast bash', Course = 'Main course', Recipe = 'Butter Muffins', Main = 0
    UNION SELECT Meal = 'Breakfast bash', Course = 'Appetizer', Recipe = 'Apple Yogurt Smoothie', Main = 0

    UNION SELECT Meal = 'Pizza party', Course = 'Main course', Recipe = 'Herby Pizza', Main = 0
    UNION SELECT Meal = 'Pizza party', Course = 'Main course', Recipe = 'Mexican Pizza', Main = 0
    UNION SELECT Meal = 'Pizza party', Course = 'Main course', Recipe = 'Cheesy Sticks', Main = 0
)
INSERT MealCourseRecipe(MealCourseID, RecipeID, IsMain, RUserID)
SELECT mc.MealCourseID, r.RecipeID, x.Main, m.RUserID
FROM x
JOIN Meal m
ON x.Meal = m.MealName
JOIN Course c
ON x.Course = c.CourseDesc
join MealCourse mc
ON m.MealID = mc.MealID
AND c.CourseID = mc.CourseID
JOIN Recipe r
ON x.Recipe = r.RecipeName
GO


;
WITH x AS(
    SELECT CookBookName = 'Treats for two', price = 30, userFN = 'Ezra'
    union SELECT CookBookName = 'Pizza Book', price = 30, userFN = 'Shmiel'
    union SELECT CookBookName = 'Big Book', price = 50, userFN = 'Shmiel'
)
INSERT CookBook(CookBookName, CookBookPrice, RUserID)
SELECT x.CookBookName, x.price, u.RUserID
FROM x
JOIN RUser u
ON x.userFN = u.FirstName
GO


;
WITH x AS(
    SELECT CookBookName = 'Treats for two', Recipe = 'Chocolate Chip Cookies', CookBookRecipeOrder = 1
    UNION SELECT CookBookName = 'Treats for two', Recipe = 'Apple Yogurt Smoothie', CookBookRecipeOrder = 2
    UNION SELECT CookBookName = 'Treats for two', Recipe = 'Cheese Bread', CookBookRecipeOrder = 3
    UNION SELECT CookBookName = 'Treats for two', Recipe = 'Butter Muffins', CookBookRecipeOrder = 4
    UNION SELECT CookBookName = 'Treats for two', Recipe = 'Cheesy Sticks', CookBookRecipeOrder = 5


    UNION SELECT CookBookName = 'Pizza Book', Recipe = 'Herby Pizza', CookBookRecipeOrder = 1
    UNION SELECT CookBookName = 'Pizza Book', Recipe = 'Mexican Pizza', CookBookRecipeOrder = 2
    UNION SELECT CookBookName = 'Pizza Book', Recipe = 'Cheesy Sticks', CookBookRecipeOrder = 3

    UNION SELECT CookBookName = 'Big Book', Recipe = 'Chocolate Chip Cookies', CookBookRecipeOrder = 1
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Apple Yogurt Smoothie', CookBookRecipeOrder = 2
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Cheese Bread', CookBookRecipeOrder = 3
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Butter Muffins', CookBookRecipeOrder = 4
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Herby Pizza', CookBookRecipeOrder = 5
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Mexican Pizza', CookBookRecipeOrder = 6
    UNION SELECT CookBookName = 'Big Book', Recipe = 'Cheesy Sticks', CookBookRecipeOrder = 7
)
INSERT CookBookRecipe(CookBookID, RecipeID, CookBookRecipeOrder)
SELECT c.CookBookID, r.RecipeID, x.CookBookRecipeOrder
FROM x
JOIN CookBook c
ON x.CookBookName = c.CookBookName
JOIN Recipe r
ON x.Recipe = r.RecipeName






