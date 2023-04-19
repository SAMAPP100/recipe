-- SM Excellent tables!
use HeartyHearth
GO

DROP TABLE IF EXISTS CookBookRecipe
DROP TABLE IF EXISTS CookBook
DROP TABLE IF EXISTS MealCourseRecipe
DROP TABLE IF EXISTS MealCourse
DROP TABLE IF EXISTS Meal
DROP TABLE IF EXISTS Direction
DROP TABLE IF EXISTS RecipeIngredient
DROP TABLE IF EXISTS Recipe
DROP TABLE IF EXISTS Cuisine
DROP TABLE IF EXISTS Course
DROP TABLE IF EXISTS Measurement
DROP TABLE IF EXISTS Ingredient
DROP TABLE IF EXISTS RUser
GO


 create table dbo.RUser(
    
    RUserID int NOT NULL identity primary key,
    FirstName varchar(25) not null CONSTRAINT c_User_First_name_cannot_be_blank CHECK(FirstName > ''),
    LastName varchar(25) not null CONSTRAINT c_User_Last_name_cannot_be_blank CHECK(LastName > ''),
    UserName varchar(25)  not null
        CONSTRAINT c_User_user_name_cannot_be_blank CHECK(UserName > '') 
        CONSTRAINT u_User_UserName UNIQUE
)
GO

create table dbo.Ingredient(
    
    IngredientID int not null identity primary key,
    IngredientDesc varchar(25)  not null
        CONSTRAINT c_Ingredient_Desc_cannot_be_blank CHECK(IngredientDesc > '')
        CONSTRAINT u_Ingredient_Desc unique, 
    IngredientImageName AS CONCAT('Ingredient-', REPLACE(IngredientDesc,' ', '-'), '.jpg') PERSISTED
)
GO

create table dbo.Measurement(
    
    MeasurementID int not null identity primary key,
    MeasurementDesc VARCHAR(25) not null 
        CONSTRAINT c_Measurement_Desc_cannot_be_blank CHECK(MeasurementDesc > '')
        CONSTRAINT u_Measurement_Desc UNIQUE
)
GO

create table dbo.Course(
    
    CourseID int not null identity primary key,
    CourseDesc VARCHAR(25) not null
        CONSTRAINT c_ourse_Desc_cannot_be_blank CHECK(CourseDesc > '')
        CONSTRAINT u_Course_Desc unique,
    CourseOrder INT not null CONSTRAINT c_Course_Order_must_be_greater_than_zero CHECK(CourseOrder > 0)
)
GO

create table dbo.Cuisine(
    
    CuisineID int not null identity primary key,
    CuisineDesc VARCHAR(25) not null 
        CONSTRAINT c_Cuisine_Desc_cannot_be_blank CHECK(CuisineDesc > '')
        CONSTRAINT u_Cuisine_Desc UNIQUE
)
go

create table dbo.Recipe(
    
    RecipeID int not null identity primary key,
    CuisineID INT NOT NULL CONSTRAINT f_Cuisine_Recipe FOREIGN KEY REFERENCES Cuisine(CuisineID),
    RUserID INT NOT NULL CONSTRAINT f_RUsers_Recipe FOREIGN KEY REFERENCES RUser(RUserID),
    RecipeName VARCHAR(35) NOT NULL 
        CONSTRAINT c_Recipe_Name_cannot_be_blank CHECK(RecipeName > '')
        CONSTRAINT u_Recipe_Name UNIQUE,
    Calories int NOT NULL,
    DraftDate DATETIME NOT NULL DEFAULT getdate(),
    PublishDate DATETIME,
    ArchiveDate DATETIME,
    CurrStatus as 
        CASE 
            WHEN ArchiveDate is not null THEN 'Archive' 
            else 
            CASE
                WHEN PublishDate is not NULL THEN 'Published'
                else 'Draft'
            END
        END,
    RecipeImageName AS CONCAT('Recipe-', REPLACE(RecipeName,' ', '-'), '.jpg') PERSISTED
)
GO

create table dbo.RecipeIngredient(
    
    RecipeIngredientID int not null identity primary key,
    RUserID INT NOT NULL CONSTRAINT f_RUser_RecipeIngredient FOREIGN KEY REFERENCES RUser(RUserID),
    RecipeID INT NOT NULL CONSTRAINT f_Recipe_RecipeIngredient FOREIGN KEY REFERENCES Recipe(RecipeID),
    IngredientID INT NOT NULL CONSTRAINT f_Ingredient_RecipeIngredient FOREIGN KEY REFERENCES Ingredient(IngredientID),
    MeasurementID INT NOT NULL CONSTRAINT f_Measurement_RecipeIngredient FOREIGN KEY REFERENCES Measurement(MeasurementID),
    Amount decimal(5,2) not NULL constraint c_RecipeIngredient_amount_must_be_greater_than_zero check(Amount > 0),
    RecipeIngredientOrder INT NOT NULL CONSTRAINT c_RecipeIngredient_Order_must_be_greater_than_zero CHECK(RecipeIngredientOrder > 0),

    constraint u_RecipeIngredient_Recipe_Order UNIQUE(RecipeID, RecipeIngredientOrder),
)
GO

create table dbo.Direction(
    
    DirectionID int not null identity primary key,
    RUserID INT NOT NULL CONSTRAINT f_RUser_Direction FOREIGN KEY REFERENCES RUser(RUserID),
    RecipeID INT NOT NULL CONSTRAINT f_Recipe_Direction FOREIGN KEY REFERENCES Recipe(RecipeID),
    StepDesc VARCHAR(200) NOT NULL CONSTRAINT c_Direction_step_desc_cannot_be_blank CHECK(StepDesc > ''),
    DirectionOrder INT NOT NULL CONSTRAINT c_Direction_Order_must_be_greater_than_zero CHECK(DirectionOrder > 0),

    constraint u_Direction_Order_Recipe unique(RecipeID, DirectionOrder)
)
GO

create table dbo.Meal(
    
    MealID int not null identity primary key,
    RUserID INT NOT NULL CONSTRAINT f_RUser_Meal FOREIGN KEY REFERENCES RUser(RUserID),
    MealName VARCHAR(25) NOT NULL
        CONSTRAINT c_Meal_name_cannot_be_blank CHECK(MealName > '')
        CONSTRAINT u_Meal_name unique,
    IsActive BIT not NULL DEFAULT 1,
    DOE DATE NOT NULL default getdate(),
    MealImage AS CONCAT('Meal-', REPLACE(MealName,' ', '-'), '.jpg') PERSISTED
)
GO

create table dbo.MealCourse(
    
    MealCourseID int not null identity primary key,
    MealID INT NOT NULL CONSTRAINT f_Meal_MealCourse FOREIGN KEY REFERENCES Meal(MealID),
    CourseID INT NOT NULL CONSTRAINT f_Course_MealCourse FOREIGN KEY REFERENCES Course(CourseID),
    RUserID INT NOT NULL CONSTRAINT f_RUser_MealCourse FOREIGN KEY REFERENCES RUser(RUserID),

    Constraint u_MealCourse_Meal_Course unique(MealID, CourseID)
)
GO

create table dbo.MealCourseRecipe(
    
    MealCourseRecipeID int not null identity primary key,
    RUserID INT NOT NULL CONSTRAINT f_RUser_MealCourseRecipe FOREIGN KEY REFERENCES RUser(RUserID),
    MealCourseID INT NOT NULL CONSTRAINT f_MealCourse_MealCourseRecipe FOREIGN KEY REFERENCES MealCourse(MealCourseID),
    RecipeID INT NOT NULL CONSTRAINT f_Recipe_MealCourseRecipe FOREIGN KEY REFERENCES Recipe(RecipeID),
    IsMain bit NOT NULL DEFAULT 0,

    constraint u_MealCourseRecipe_MealCourse_Recipe unique( MealCourseID, RecipeID)
)
GO

create table dbo.CookBook(
    
    CookBookID int not null identity primary key,
    RUserID INT NOT NULL CONSTRAINT f_RUser_CookBook FOREIGN KEY REFERENCES RUser(RUserID),
    CookBookName VARCHAR(50) NOT NULL
        constraint c_CookBook_name_cannot_be_blank CHECK(CookBookName > '')
        CONSTRAINT u_CookBook_name unique,
    CookBookPrice DECIMAL(5,2) NOT NULL CONSTRAINT c_CookBook_price_must_be_greater_than_zero CHECK(CookBookPrice > 0),
    IsActive bit NOT NULL DEFAULT 1,
    DOE DATE NOT NULL DEFAULT GETDATE()
)
GO

create table dbo.CookBookRecipe(
    
    CookBookRecipeID int not null identity primary key,
    CookBookID INT NOT NULL CONSTRAINT f_CookBook_CookBookRecipe FOREIGN KEY REFERENCES CookBook(CookBookID),
    RecipeID INT NOT NULL CONSTRAINT f_Recipe_CookBookRecipe FOREIGN KEY REFERENCES Recipe(RecipeID),
    CookBookRecipeOrder INT not null CONSTRAINT c_CookBookRecipe_ordermust_be_greater_than_zero CHECK(CookBookRecipeOrder > 0),

    CONSTRAINT u_CookBookRecipe_CookBook_RecipeOrder UNIQUE(CookBookRecipeOrder, CookBookID),
    Constraint u_CookBookRecipe_CookBook_Recipe unique(CookBookID, RecipeID)
)
GO
