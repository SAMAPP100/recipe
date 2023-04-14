create or alter procedure dbo.UserGet(@UserID int = 0, @All bit = 0, @LastName varchar(25) = '')
as 
begin

	select @LastName = nullif(@LastName, '')

	select u.UserID, u.FirstName, u.LastName, u.UserName
	from Users u
	Where u.UserID = @UserID
	or @All = 1 
	or u.LastName like '%' + @LastName + '%'
	order by u.FirstName
end
go

-- EXEC UserGet

-- EXEC UserGet @All = 1



-- exec UserGet @LastName = 'a'
-- exec UserGet @LastName = ''

-- declare @id int

-- select top 1 @id = u.UserID from Users u

-- -- -- select @id

-- exec UserGet @UserID = @id