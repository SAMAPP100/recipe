using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string recipename)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("RecipeGet");
            cmd.Parameters["@RecipeName"].Value = recipename;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable Load(int recipeid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("RecipeGet");
            cmd.Parameters["@RecipeID"].Value = recipeid;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable GetCuisineList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("CuisineGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }

        public static DataTable GetUsersList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSqlCommand("UserGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
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
                    $" RUserID = '{r["RUserID"]}'",
                    $"where RecipeID = {r["RecipeID"]} ");
            }
            else
            {
                sql = "insert Recipe(RecipeName, CuisineID, Calories, RUserID) ";
                sql += $"select '{r["RecipeName"]}', {r["CuisineID"]}, '{r["Calories"]}', '{r["RUserID"]}'";
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