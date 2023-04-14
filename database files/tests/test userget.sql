EXEC UserGet

EXEC UserGet @All = 1



exec UserGet @LastName = 'a'
exec UserGet @LastName = ''

declare @id int

select top 1 @id = u.UserID from Users u

-- -- select @id

exec UserGet @UserID = @id