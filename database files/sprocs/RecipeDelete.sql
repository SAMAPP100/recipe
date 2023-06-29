create or alter procedure dbo.RecipeDelete(@RecipeID int)
as
begin
	declare @return int = 0
	
	begin try
		begin tran
		--AF Don't forget to delete the actual recipe here
			delete RecipeIngredient where RecipeID = @RecipeID
			delete Direction where RecipeID = @RecipeID
		commit
	end try
	begin catch
		rollback;
		throw
	end catch
end