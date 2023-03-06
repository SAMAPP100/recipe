-- SM Excellent! 100% See comments

--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.
-- SM You should also delete from users table.

Delete cr
-- Select *
FROM Users u
JOIN CookBook c
ON u.UserID = c.UserID
JOIN CookBookRecipe cr
ON c.CookBookID = cr.CookBookID
WHERE u.UserName = 'SBreuer'

Delete c
-- Select *
FROM Users u
JOIN CookBook c
ON u.UserID = c.UserID
WHERE u.UserName = 'SBreuer'

DELETE mcr
-- Select *
FROM Users u
JOIN Meal m
ON u.UserID = m.UserID
JOIN MealCourse mc
ON m.MealID = mc.MealID
JOIN MealCourseRecipe mcr
ON mc.MealCourseID = mcr.MealCourseID
WHERE u.UserName = 'SBreuer'

DELETE mc
-- Select *
FROM Users u
JOIN Meal m
ON u.UserID = m.UserID
JOIN MealCourse mc
ON m.MealID = mc.MealID
WHERE u.UserName = 'SBreuer'

DELETE m
-- Select *
FROM Users u
JOIN Meal m
ON u.UserID = m.UserID
WHERE u.UserName = 'SBreuer'

DELETE ri
-- Select *
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
WHERE u.UserName = 'SBreuer'

DELETE d
-- Select *
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
JOIN Direction d
ON r.RecipeID = d.RecipeID
WHERE u.UserName = 'SBreuer'

delete c
-- SELECT *
FROM CookBookRecipe c
JOIN Recipe r
on c.RecipeID = r.RecipeID
JOIN Users u
ON r.UserID = u.UserID
WHERE u.UserName = 'SBreuer'

DELETE r
-- Select *
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
WHERE u.UserName = 'SBreuer'


--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. Write the SQL that clones a specific recipe, add " - clone" to its name.

insert Recipe(RecipeName, CuisineID, Calories, UserID, DraftDate)
SELECT CONCAT(r.RecipeName, ' - clone'), r.CuisineID, r.Calories, r.UserID, GETDATE()
FROM Recipe r
WHERE r.RecipeName = 'Cheese Bread'

-- SM Do as CTE
INSERT RecipeIngredient(UserID, IngredientID, MeasurementID, Amount, RecipeIngredientOrder, RecipeID)
select ri.UserID, ri.IngredientID, ri.MeasurementID, ri.Amount, ri.RecipeIngredientOrder, (Select rs.RecipeID from Recipe rs where rs.RecipeName = CONCAT(r.RecipeName, ' - clone'))
FROM Recipe r
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
WHERE r.RecipeName = 'Cheese Bread'

-- SM Same here
INSERT Direction(StepDesc, DirectionOrder, UserID, RecipeID)
Select d.StepDesc, d.DirectionOrder, d.UserID, (Select rs.RecipeID from Recipe rs where rs.RecipeName = CONCAT(r.RecipeName, ' - clone'))
FROM Recipe r
JOIN Direction d
ON r.RecipeID = d.RecipeID
WHERE r.RecipeName = 'Cheese Bread'


/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The price should be the number of recipes multiplied by $1.33
Sequence the book by recipe name.

Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/
-- SM Same here for both
INSERT CookBook(UserID, CookBookName, CookBookPrice)
SELECT u.UserID, CONCAT('Recipes by ', u.FirstName, ' ', u.LastName), (Select COUNT(*) * 1.33 from Recipe r where r.UserID = u.UserID)
FROM Users u
WHERE u.UserName = 'SBreuer'

INSERT CookBookRecipe(RecipeID, CookBookRecipeOrder, CookBookID)
SELECT r.RecipeID, ROW_NUMBER() OVER(ORDER by r.RecipeName), (Select c.CookBookID from CookBook c where c.CookBookName = CONCAT('Recipes by ', u.FirstName, ' ', u.LastName))
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
WHERE u.UserName = 'SBreuer'

/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calorie total for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count for butter went down by 2 per ounce, and 10 per stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/

update r
SET r.Calories =
	case m.MeasurementDesc
		when 'oz' then r.Calories - (ri.Amount * 2)
		when 'cup' then r.Calories - (ri.Amount * 5)
	end
FROM Ingredient i
JOIN RecipeIngredient ri
ON ri.IngredientID = i.IngredientID
JOIN Measurement m
ON ri.MeasurementID = m.MeasurementID
JOIN Recipe r
ON ri.RecipeID = r.RecipeID
WHERE i.IngredientDesc = 'Shredded cheese'




/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time that recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/

;
WITH x AS(
	SELECT AvgHoursToPublish = AVG(DATEDIFF(HOUR, r.DraftDate, r.PublishDate))
	FROM Recipe r
)
SELECT u.FirstName, u.LastName, EmailAdd = CONCAT(LEFT(u.FirstName,1), u.LastName, '@heartyhearth.com'),
Alert = CONCAT('Your recipe ',
				r.RecipeName,
				' is sitting in draft for ',
				DATEDIFF(HOUR, r.DraftDate, GETDATE()),
				' hours.That is ',
				DATEDIFF(HOUR, r.DraftDate, GETDATE()) - x.AvgHoursToPublish ,
				' hours more than the average ',
				 x.AvgHoursToPublish,
				 ' hours all other recipes took to be published.'
		)
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
CROSS JOIN x
WHERE r.CurrStatus = 'Draft' 
AND DATEDIFF(HOUR, r.DraftDate, GETDATE()) > x.AvgHoursToPublish


/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average price is [Y]. You can order them all and recieve a 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/

;
WITH x AS(
	SELECT AvgPrice = FORMAT(AVG(c.CookBookPrice), 'N') 
	FROM CookBook c
)
SELECT EmailBody =
		CONCAT('Order cookbooks from HeartyHearth.com! We have ',
 			COUNT(*),
		 ' books for sale, average price is ',
		  x.AvgPrice,
		  '. You can order them all and recieve a 25% discount, for a total of ',
		  SUM(c.CookBookPrice) * 0.75 ,
		  '.Click <a href = "www.heartyhearth.com/order/',
		   NEWID(),
		   '">here</a> to order.')
FROM CookBook c
cross JOIN x
GROUP BY x.AvgPrice