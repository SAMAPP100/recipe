using System.Data;
using System.Diagnostics;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            string sql = "SELECT r.RecipeName, r.RecipeID, c.CuisineDesc, u.UserName, r.Calories, r.CurrStatus, r.RecipeImageName  FROM Recipe r  JOIN Cuisine c   ON r.CuisineID = c.CuisineID  JOIN Users u  ON r.UserID = u.UserID where r.RecipeName like '%" + recipename + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            string sql = "SELECT  r.RecipeID, r.RecipeName, r.CuisineID, r.UserID, r.Calories, r.DraftDate, r.PublishDate, r.ArchiveDate, r.RecipeImageName  FROM Recipe r where r.RecipeID = " + recipeid.ToString();
            return SQLUtility.GetDataTable(sql);
        }

        public static DataTable GetCuisineList()
        {
            return SQLUtility.GetDataTable("SELECT  CuisineId, CuisineDesc  FROM Cuisine");
        }

        public static DataTable GetUsersList()
        {
            return SQLUtility.GetDataTable("SELECT UserID, UserName  FROM Users");
        }

        public static void Save(DataTable dtrecipes)
        {
            DataRow r = dtrecipes.Rows[0];
            int id = (int)r["RecipeID"];

            string sql;
            // I was instructed not to update the dates because I was having date format issues.
            if (id > 0)
            {

                sql = string.Join(Environment.NewLine, $"update Recipe set",
                    $" RecipeName = '{r["RecipeName"]}',",
                    $" CuisineID = '{r["CuisineID"]}',",
                    $" Calories = '{r["Calories"]}', ",
                    $" UserID = '{r["UserID"]}'",
                    $"where RecipeID = {r["RecipeID"]} ");
            }
            else
            {
                sql = "insert Recipe(RecipeName, CuisineID, Calories, UserID) ";
                sql += $"select '{r["RecipeName"]}', {r["CuisineID"]}, '{r["Calories"]}', '{r["UserID"]}'";
            }
            Debug.WriteLine(sql);
            SQLUtility.ExecuteSQL(sql);
        }

        public static void Delete(DataTable dtrecipes)
        {
            int id = (int)dtrecipes.Rows[0]["RecipeID"];
            string sql = "delete Recipe where RecipeID = " + id;
            SQLUtility.ExecuteSQL(sql);
        }

    }
}