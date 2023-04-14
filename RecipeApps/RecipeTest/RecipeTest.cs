using CPUFrameWork;
using System.Data;

namespace RecipeTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
            DBManager.SetConnectionString("Server=.\\SQLExpress;Database=HeartyHearth;Trusted_Connection=true;");
        }

        [Test]
        [TestCase("Cheese cake", "French", 20, "EHudson")]
        [TestCase("Oatmeal ", "Mexican", 45, "JSmith")]
        public void InsertNewRecipe(string rn, string cuisine, int calories, string user)
        {
            DataTable dt = SQLUtility.GetDataTable("select * from Recipe where RecipeId = 0");
            DataRow r = dt.Rows.Add();
            Assume.That(dt.Rows.Count == 1);

            int cuisineid = SQLUtility.GetFirstColunmFirstRowValue("SELECT TOP 1 CuisineID FROM Cuisine WHERE CuisineDesc = '" + cuisine + "'");
            Assume.That(cuisineid > 0, "Can't run test no cuisines in the DB");

            int userid = SQLUtility.GetFirstColunmFirstRowValue("SELECT TOP 1 UserID FROM Users WHERE UserName = '" + user + "'");
            Assume.That(cuisineid > 0, "Can't run test no users in the DB");

            rn += " " + DateTime.Now.ToString();
            TestContext.WriteLine("Insert recipe " + rn);

            r["RecipeName"] = rn;
            r["CuisineID"] = cuisineid;
            r["Calories"] = calories;
            r["UserID"] = userid;
            Recipe.Save(dt);

            int newid = SQLUtility.GetFirstColunmFirstRowValue("select * from Recipe where RecipeName = '" + rn + "'");
            Assert.IsTrue(newid > 0, $"Recipe {rn} is not found in the db");
            TestContext.WriteLine($"Recipe {rn} is found in db with pk {newid}");

        }

        [Test]
        public void ChangeExistingRecipeCalories()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "No recipes in DB can't run tests");
            int calories = SQLUtility.GetFirstColunmFirstRowValue("select calories from Recipe where recipeid = " + recipeid);
            TestContext.WriteLine("Calories for recipeid " + recipeid + " is " + calories);
            calories += 1;
            TestContext.WriteLine("Change Calories to " + calories);

            DataTable dt = Recipe.Load(recipeid);
            dt.Rows[0]["Calories"] = calories;
            Recipe.Save(dt);

            int newcalories = SQLUtility.GetFirstColunmFirstRowValue("select calories from Recipe where recipeid = " + recipeid);
            Assert.IsTrue(newcalories == calories, "Calories for recipeid (" + recipeid + ") is " + newcalories);
            TestContext.WriteLine("Calories for recipeid (" + recipeid + ") is " + newcalories);
        }


        [Test]
        public void DeleteRecipe()
        {
            DataTable dt = SQLUtility.GetDataTable("select r.RecipeID, r.RecipeName from Recipe r left JOIN RecipeIngredient ri on r.RecipeID = ri.RecipeID WHERE ri.RecipeIngredientID IS NULL");
            int recipeid = 0;
            string recipedesc = "";
            if (dt.Rows.Count > 0)
            {
                recipeid = (int)dt.Rows[0]["RecipeID"];
                recipedesc = (string)dt.Rows[0]["RecipeName"];
            }
            Assume.That(recipeid > 0, "No recipes without Ingredients in DB can't run tests");

            TestContext.WriteLine("existing recipe without ingredient id = " + recipeid + " " + recipedesc);
            TestContext.WriteLine("Ensure that app can delete recipe " + recipeid);
            Recipe.Delete(dt);
            DataTable dtafterdelete = SQLUtility.GetDataTable("select * from Recipe where RecipeID = " + recipeid);
            Assert.IsTrue(dtafterdelete.Rows.Count == 0, "Record with recipe id " + recipeid + "is still in DB");
            TestContext.WriteLine("Record with recipe id " + recipeid + " does not exist in DB");
        }

        [Test]
        public void LoadRecipe()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "No recipes in DB can't run tests");

            TestContext.WriteLine("existing recipe id = " + recipeid);
            TestContext.WriteLine("Ensure that app loads recipe " + recipeid);
            DataTable dt = Recipe.Load(recipeid);

            int loadedid = (int)dt.Rows[0]["recipeid"];

            Assert.IsTrue(loadedid == recipeid, loadedid + " <> " + recipeid);
            TestContext.WriteLine("Loaded recipe (" + loadedid + ") " + recipeid);
        }

        [Test]
        public void GetListOfCuisine()
        {
            int cuisinecount = SQLUtility.GetFirstColunmFirstRowValue("select total = count(*) from Cuisine");
            Assume.That(cuisinecount > 0, "No Cuisine's in DB can't do test");

            DataTable dt = Recipe.GetCuisineList();

            TestContext.WriteLine("Num of Cuisine's in DB = " + cuisinecount);
            TestContext.WriteLine("Ensure that num rows return by app matches " + cuisinecount);

            Assert.IsTrue(dt.Rows.Count == cuisinecount, "Error num rows returned by the app (" + dt.Rows.Count + ")  <> " + cuisinecount);
            TestContext.WriteLine("Number of Cuisine's = " + dt.Rows.Count);
        }

        [Test]
        public void GetListOfUsers()
        {
            int usercount = SQLUtility.GetFirstColunmFirstRowValue("select total = count(*) from Users");
            Assume.That(usercount > 0, "No Users in DB can't do test");

            DataTable dt = Recipe.GetUsersList();

            TestContext.WriteLine("Num of users in DB = " + usercount);
            TestContext.WriteLine("Ensure that num rows return by app matches " + usercount);

            Assert.IsTrue(dt.Rows.Count == usercount, "Error num rows returned by the app (" + dt.Rows.Count + ")  <> " + usercount);
            TestContext.WriteLine("Number of users = " + dt.Rows.Count);
        }

        private int GetExistingRecipeId()
        {
            return SQLUtility.GetFirstColunmFirstRowValue("select top 1 RecipeID from Recipe");
        }

    }
}