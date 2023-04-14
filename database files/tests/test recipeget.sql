EXEC recipeget

EXEC recipeget @All = 1



exec recipeget @RecipeName = 'a'
exec recipeget @RecipeName = ''

declare @id int

select top 1 @id = r.RecipeID from Recipe r

-- select @id

exec recipeget @RecipeID = @id
