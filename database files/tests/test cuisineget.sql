EXEC CuisineGet

EXEC CuisineGet @All = 1



exec CuisineGet @CuisineDesc = 'a'
exec CuisineGet @CuisineDesc = ''

declare @id int

select top 1 @id = c.CuisineID from Cuisine c

-- -- select @id

exec CuisineGet @CuisineID = @id