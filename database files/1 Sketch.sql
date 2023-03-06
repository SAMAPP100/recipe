-- SM Excellent work! See comments no need to resubmit the sketch, you can create database, but in table "ALL" foreign keys should be after PK
/*
Users
    UserID int identity primary key
    FirstName varchar(25) not blank
    LastName varchar(25) not blank
    UserName varchar(25) not blank unique

-- SM No need for userid
Ingredient
    IngredientID
    IngredientDesc unique
    IngredientImageName computed

Measurement
    MeasurementID
    MeasurementDesc


Course
    CourseID
    CourseDesc unique
    CourseOrder

-- SM Cuisine
Cuisine
    CuisineID
    CuisineDesc unique

Recipe
    RecipeID
    CuisineID FK
    RecipeName unique
    Calories
    DraftDate
    PublishDate
    ArchiveDate
    CurrStatus computed
    RecipeImageName computed
    UserID FK

RecipeIngredient
    RecipeIngredientID
    RecipeID FK
    IngredientID FK
    Amount
    MeasurementID FK
    RecipeIngredientOrder
    UserID FK

Direction
    DirectionID
    RecipeID FK
    DirectionOrder
    StepDesc
    UserID FK


Meal
    MealID
    MealName unique
    Active
    DOE
    MealImage computed
    UserID FK


MealCourse
    MealCourseID
    MealID FK
    CourseID FK
    UserID FK

    Constraint unique MealID CourseID

-- SM MealCourseID and RecipeID should be unique
MealCourseRecipe
    MealCourseRecipeID
    MealCourseID FK
    RecipeID FK
    IsMain bit
    UserID FK

    constraint unique MealCourseID RecipeID

CookBook
    CookBookID
    CookBookName unique
    CookBookPrice
    IsActive bit
    DOE
    UserID

CookBookRecipe
    CookBookRecipeID
    CookBookID FK
    RecipeID FK
    CookBookRecipeOrder

    Constraint unique CookBookID RecipeID

*/