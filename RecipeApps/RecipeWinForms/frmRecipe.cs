using CPUFrameWork;
using CPUWindowsFormFrameWork;
using System.Data;
using System.Diagnostics;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        DataTable dtrecipes;
        public frmRecipe()
        {
            InitializeComponent();
            btnSave.Click += BtnSave_Click;
            btnDelete.Click += BtnDelete_Click;
        }



        public void ShowForm(int recipeid)
        {
            string sql = "SELECT  r.RecipeID, r.RecipeName, r.CuisineID, r.UserID, r.Calories, r.DraftDate, r.PublishDate, r.ArchiveDate, r.RecipeImageName  FROM Recipe r where r.RecipeID = " + recipeid.ToString();
            dtrecipes = SQLUtility.GetDataTable(sql);
            if (recipeid == 0)
            {
                dtrecipes.Rows.Add();
            }
            DataTable tdcuisine = SQLUtility.GetDataTable("SELECT  CuisineId, CuisineDesc  FROM Cuisine");
            WindowsFormsUtility.SetListBinding(lstCuisineDesc, tdcuisine, dtrecipes, "Cuisine");

            DataTable tdusers = SQLUtility.GetDataTable("SELECT UserID, UserName  FROM Users");
            WindowsFormsUtility.SetListBinding(lstUserName, tdusers, dtrecipes, "Users", "UserID");

            WindowsFormsUtility.SetControlBinding(txtRecipeName, dtrecipes);
            WindowsFormsUtility.SetControlBinding(txtCalories, dtrecipes);
            WindowsFormsUtility.SetControlBinding(txtRecipeImageName, dtrecipes);
            WindowsFormsUtility.SetControlBinding(txtDraftDate, dtrecipes);
            WindowsFormsUtility.SetControlBinding(txtPublishDate, dtrecipes);
            WindowsFormsUtility.SetControlBinding(txtArchiveDate, dtrecipes);

            this.Show();
        }

        private void Save()
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
                    $" Calories = '{r["Calories"]}'",
                    $"where RecipeID = {r["RecipeID"]} ");
            }
            else
            {
                sql = "insert Recipe(RecipeName, CuisineID, Calories, UserID) ";
                sql += $"select '{r["RecipeName"]}', {r["CuisineID"]}, '{r["Calories"]}', '{r["UserID"]}'";
            }



            Debug.Print(sql);
            SQLUtility.ExecuteSQL(sql);
        }

        private void Delete()
        {
            int id = (int)dtrecipes.Rows[0]["RecipeID"];
            string sql = "delete Recipe where RecipeID = " + id;
            SQLUtility.ExecuteSQL(sql);
            this.Close();
        }

        private void BtnSave_Click(object? sender, EventArgs e)
        {
            Save();
        }
        private void BtnDelete_Click(object? sender, EventArgs e)
        {
            Delete();
        }
    }
}
