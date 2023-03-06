-- SM Excellent! 100%
-- Our website development is underway! 
-- Below is the layout of the pages on our website, please provide the SQL to produce the necessary result sets.

-- Note: 
-- a) When the word 'specific' is used, pick one record (of the appropriate type, recipe, meal, etc.) for the query. The way the website works is that a list of items are displayed and then the user picks one and navigates to the "details" page.
-- b) Whenever you have a record for a specific item include the name of the picture for that item. That is because the website will always show a picture of the item.

-- Home Page
--     One resultset with number of recipes, meals, and cookbooks


SELECT NumRecipes = count(distinct r.RecipeID), NumMeals = COUNT(distinct m.MealID), NumCookBooks = COUNT(distinct c.CookBookID)
FROM Recipe r
CROSS JOIN Meal m
CROSS JOIN CookBook c

-- Recipe list page:
--     List of all Recipes that are either published or archived, published recipes should appear at the top. 
-- 	Archived recipes should appear gray. Surround the archived recipe with <span style="color:gray">recipe name</span>
--     In the resultset show the Recipe with its status, dates it was published and archived (blank if not archived), user, number of calories and number of ingredients.

-- SB Because than I have to group by all the colunms i'm returning. I actually spoke to a mentor who told me it's much neater code with a subquery. 
SELECT RecipeName =
    case r.CurrStatus
        when 'Published' then r.RecipeName
        else concat('<span style="color:gray">', r.RecipeName ,'</span>')
    end,
    r.CurrStatus, r.PublishDate, ArchiveDate = ISNULL( CONVERT(varchar, r.ArchiveDate, 21), ''), u.UserName, r.Calories, NumOfIngredients = COUNT(*)
    -- NumOfIngredients =  (Select COUNT(*) from RecipeIngredient ri where ri.RecipeID = r.RecipeID)
FROM Recipe r
JOIN Users u
ON r.UserID = u.UserID
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
WHERE r.CurrStatus IN('Archive', 'Published')
GROUP BY r.RecipeName,  r.CurrStatus, r.PublishDate, r.ArchiveDate, u.UserName, r.Calories
ORDER BY r.CurrStatus DESC

-- Recipe details page:
--     Show for a specific recipe (three result sets):
--         a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
--         b) List of ingredients: show the measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
--         c) List of prep steps sorted by sequence.

-- SM This is much neater than subquery.
SELECT r.RecipeName, r.Calories,
    -- NumSteps = (select count(*) from Direction d WHERE d.RecipeID = r.RecipeID),
    -- NumIngredients = (select count(*) from RecipeIngredient ri WHERE ri.RecipeID = r.RecipeID)
     NumSteps = COUNT(distinct d.DirectionID ), NumIngredients = COUNT(distinct ri.RecipeIngredientID )
FROM Recipe r
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
JOIN Direction d
ON r.RecipeID = d.RecipeID
WHERE r.RecipeName = 'Apple Yogurt Smoothie'
GROUP BY r.RecipeName, r.Calories

SELECT Ingredients = CONCAT(FORMAT(ri.Amount, '##.##'), ' ', m.MeasurementDesc, ' ', i.IngredientDesc)
FROM Recipe r
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
join Ingredient i
on ri.IngredientID = i.IngredientID
JOIN Measurement m
on ri.MeasurementID = m.MeasurementID
WHERE r.RecipeName = 'Apple Yogurt Smoothie'
ORDER BY ri.RecipeIngredientOrder

SELECT d.StepDesc
FROM Recipe r
JOIN Direction d
ON r.RecipeID = d.RecipeID
WHERE r.RecipeName = 'Apple Yogurt Smoothie'
ORDER BY d.DirectionOrder
-- Meal list page:
--     All active meals, meal name, user that created meal, number of calories for the meal, number of courses, and number of recipes per each meal, sorted by name of meal

SELECT m.MealName, u.UserName, Calories = SUM(r.Calories) , NumRecipes = COUNT(*), NumCourses = COUNT(distinct  mc.MealCourseID)
FROM Meal m
JOIN Users u
ON m.userID = u.UserID
JOIN MealCourse mc
ON m.MealID = mc.MealID
JOIN MealCourseRecipe mcr
ON mc.MealCourseID = mcr.MealCourseID
JOIN Recipe r
ON mcr.RecipeID = r.RecipeID
WHERE m.IsActive = 1
GROUP BY m.MealName, u.UserName
ORDER BY m.MealName

-- Meal details page:
--     Show for a specific meal:
--         a) Meal header: meal name, user, date created.
SELECT m.MealName, u.UserName, m.DOE
FROM Meal m
JOIN Users u
ON m.UserID = u.UserID
WHERE m.MealName = 'Pizza party'

--         b) List of all recipes. 
--             Display in one column the course type, recipe, and for the main course show which dish is the main and which are side. 
-- 			In this format "Course Type: Main\Side dish - Recipe Name. Then main dishes should be bold, using the bold tags as shown below
--                 ex: 
--                     Appetizer: Mixed Greens
--                     <b>Main: Main dish - Onion Pastrami Chicken</b>
-- 					Main: Side dish - Roasted cucumbers with mustard

SELECT CourseRecipes = CONCAT(
    CASE c.CourseDesc
        WHEN 'Main course' THEN 
            CASE mcr.IsMain 
                when 1 then '<b>Main: Main dish - '
                ELSE 'Main: Side dish - '
            END
        ELSE c.CourseDesc + ': '
    END,
    r.RecipeName,
    CASE mcr.IsMain 
        WHEN 1 THEN '</b>'
    END
)

FROM Meal m
JOIN MealCourse mc
ON m.MealID = mc.MealID
JOIN MealCourseRecipe mcr
ON mc.MealCourseID = mcr.MealCourseID
JOIN Course c
ON mc.CourseID = c.CourseID
JOIN Recipe r
ON mcr.RecipeID = r.RecipeID
where m.MealName = 'Breakfast bash'
ORDER BY c.CourseOrder

-- Cookbook list page:
--     Show all active cookbooks with author and number of recipes per book. Sorted by book name.

Select c.CookBookName, u.UserName, NumRecipes = COUNT(*)
FROM CookBook c
JOIN Users u
ON c.UserID = u.UserID
JOIN CookBookRecipe cr
on c.CookBookID = cr.CookBookID
where c.IsActive = 1
group BY c.CookBookName, u.UserName
ORDER BY c.CookBookName

-- Cookbook details page:
--     Show for specific cookbook:
--     a) Cookbook header: cookbook name, user, date created, price, number of recipes.
SELECT c.CookBookName, u.UserName, c.DOE, c.CookBookPrice, NumRecipes = COUNT(*)
FROM CookBook c
JOIN Users u
ON c.UserID = u.UserID
JOIN CookBookRecipe cr
ON C.CookBookID = CR.CookBookID
WHERE c.CookBookName = 'Pizza Book'
GROUP BY c.CookBookName, u.UserName, c.DOE, c.CookBookPrice

--     b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  Note: User will click on recipe to see all ingredients and steps.

SELECT r.RecipeName, s.CuisineDesc, NumSteps = COUNT(distinct d.DirectionID ), NumIngredients = COUNT(distinct ri.RecipeIngredientID ) --NumIngredients = (select COUNT(*) from RecipeIngredient ri where ri.RecipeID = r.RecipeID), NumSteps = (select COUNT(*) from Direction d where d.RecipeID = r.RecipeID)
FROM CookBook c
JOIN CookBookRecipe cr
ON c.CookBookID = cr.CookBookID
JOIN Recipe r
ON cr.RecipeID = r.RecipeID
JOIN Cuisine s
on r.CuisineID = s.CuisineID
JOIN RecipeIngredient ri
ON r.RecipeID = ri.RecipeID
JOIN Direction d
ON r.RecipeID = d.RecipeID
WHERE c.CookBookName = 'Pizza Book'
GROUP BY r.RecipeName, s.CuisineDesc, cr.CookBookRecipeOrder
ORDER BY cr.CookBookRecipeOrder

-- April Fools Page:
--     On April 1st we have a page with a joke cookbook. For that page provide the following.
--     a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name proper cased. There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.

SELECT Recipe = UPPER(LEFT(REVERSE(r.RecipeName), 1)) + LOWER(RIGHT(REVERSE(r.RecipeName), LEN(REVERSE(r.RecipeName)) - 1)), RecipeImage = CONCAT('Recipe-', REPLACE(UPPER(LEFT(REVERSE(r.RecipeName), 1)) + LOWER(RIGHT(REVERSE(r.RecipeName), LEN(REVERSE(r.RecipeName)) - 1)),' ', '-'), '.jpg')
FROM CookBookRecipe cr
JOIN Recipe r
ON cr.RecipeID = r.RecipeID

--     b) When the user clicks on a specific recipe they should see a list of the first ingredient of each recipe in the system, and a list of the last step in each recipe in the system
------------------------------------------------------------

;
WITH x AS(
    SELECT d.RecipeID, MaxDirection = MAX(d.DirectionOrder)
    From Direction d
    group BY d.RecipeID
)
SELECT d.StepDesc, i.IngredientDesc
FROM x
JOIN Direction d
ON d.RecipeID = x.RecipeID
AND d.DirectionOrder = x.MaxDirection
JOIN Recipe r
ON d.RecipeID = r.RecipeID
JOIN RecipeIngredient ri 
ON r.RecipeID = ri.RecipeID
JOIN Ingredient i
ON ri.IngredientID = i.IngredientID
WHERE ri.RecipeIngredientOrder = 1

-- For site administration page:
-- --5 seperate reports
--     a) List of how many recipes each user created per status. Show 0 if none

SELECT u.UserName, CurrStatus = ISNULL(r.CurrStatus, ''), RecipesCreated = COUNT(r.RecipeID)
FROM Users u
LEFT JOIN Recipe r
ON u.UserID = r.UserID
GROUP by u.UserName, r.CurrStatus
-- 	b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
SELECT u.UserName, RecipesCreated = COUNT(r.RecipeID), AvgDaysToPublish = ISNULL(AVG( DATEDIFF(DAY, r.DraftDate, r.PublishDate)),'')
FROM Users u
LEFT JOIN Recipe r
ON u.UserID = r.UserID
GROUP by u.UserName
--     c) List of how many meals each user created and whether they're active or inactive. Show 0 if none

SELECT u.UserName, IsActive = 
        case m.IsActive
        when 1 then 'Active'
        when 0 then 'Inactive'
        else ''
        END,
         NumMeals = COUNT(m.MealID)
FROM Users u
LEFT JOIN Meal m
ON u.UserID = m.UserID
GROUP BY u.UserName, m.IsActive

--     d) List of how many cookbooks each user created and whether they're active or inactive. Show 0 if none

Select u.UserName, IsActive = 
        case c.IsActive
        when 1 then 'Active'
        when 0 then 'Inactive'
        else ''
        END,
         NumCookBooks = COUNT(c.CookBookID)
FROM Users u
LEFT JOIN CookBook c
ON u.UserID = c.UserID
GROUP BY u.UserName, c.IsActive

--     e) List of archived recipes that were never published, and how long it took for them to be archived.

SELECT r.RecipeName, DaysToBeArchived = DATEDIFF(DAY, r.DraftDate, r.ArchiveDate)
FROM Recipe r
WHERE r.CurrStatus = 'Archive' 
AND r.PublishDate IS NULL

-- For user dashboard page:
--     a) Show number of the user's recipes, meals and cookbooks. 

Select u.UserName, Recipes = COUNT(DISTINCT r.RecipeID), Meals = COUNT(DISTINCT m.MealID), CookBooks = COUNT(DISTINCT c.CookBookID)
FROM Users u
left JOIN Recipe r
ON u.UserID = r.UserID
left JOIN Meal m
ON u.UserID = m.UserID
LEFT JOIN CookBook c
ON u.UserID = c.UserID
WHERE u.UserName = 'ECarson'
GROUP BY u.UserName

--     b) List of their recipes, display the status and the number of hours between the status it's in and the one before that. Show null if recipe has the status drafted.

Select r.RecipeName, r.CurrStatus, HoursBetweenStatus =
Case 
    when r.PublishDate is not null or r.ArchiveDate is not null then
        DATEDIFF(HOUR, 
        case 
            when r.PublishDate is null then r.DraftDate
            else r.PublishDate          
        end,
        case 
            when r.ArchiveDate is null then r.PublishDate
            else r.ArchiveDate
        end
        )
    else null
end
FROM Users u
JOIN Recipe r
ON u.UserID = r.UserID
WHERE u.UserName = 'ECarson'

--     c) Count of their recipes per cuisine. Show 0 for none.

SELECT c.CuisineDesc, NumRecipes = COUNT(r.RecipeID)
FROM Users u
cross JOIN Cuisine c
left JOIN Recipe r
ON c.CuisineID = r.CuisineID
And u.UserID = r.UserID
WHERE u.UserName = 'ECarson'
GROUP BY c.CuisineDesc



