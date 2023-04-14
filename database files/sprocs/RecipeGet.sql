create or alter procedure dbo.RecipeGet(@RecipeID int = 0, @All bit = 0, @RecipeName varchar(35) = '')
as 
begin

	select @RecipeName = nullif(@RecipeName, '')

	select *
	from Recipe r
	Where r.RecipeID = @RecipeID
	or @All = 1 
	or r.RecipeName like '%' + @RecipeName + '%'
	order by r.RecipeName
end
go

-- EXEC recipeget

-- EXEC recipeget @All = 1



-- exec recipeget @RecipeName = 'a'
-- exec recipeget @RecipeName = ''

-- declare @id int

-- select top 1 @id = r.RecipeID from Recipe r

-- -- select @id

-- exec recipeget @RecipeID = @id
