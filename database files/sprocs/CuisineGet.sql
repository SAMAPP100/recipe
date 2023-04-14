create or alter procedure dbo.CuisineGet(@CuisineID int = 0, @All bit = 0, @CuisineDesc varchar(25) = '')
as 
begin

	select @CuisineDesc = nullif(@CuisineDesc, '')

	select c.CuisineID, c.CuisineDesc
	from Cuisine c
	Where c.CuisineID = @CuisineID
	or @All = 1 
	or c.CuisineDesc like '%' + @CuisineDesc + '%'
	order by c.CuisineDesc
end
go

-- EXEC CuisineGet

-- EXEC CuisineGet @All = 1



-- exec CuisineGet @CuisineDesc = 'a'
-- exec CuisineGet @CuisineDesc = ''

-- declare @id int

-- select top 1 @id = c.CuisineID from Cuisine c

-- -- -- select @id

-- exec CuisineGet @CuisineID = @id