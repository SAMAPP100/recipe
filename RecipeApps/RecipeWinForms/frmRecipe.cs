using CPUFrameWork;
using System.Data;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        public frmRecipe()
        {
            InitializeComponent();
        }
        public void ShowForm(int recipeid)
        {
            string sql = "SELECT  r.RecipeID, r.RecipeName, c.CuisineDesc, u.UserName, r.Calories, r.DraftDate, r.PublishDate, r.ArchiveDate, r.RecipeImageName  FROM Recipe r  JOIN Cuisine c   ON r.CuisineID = c.CuisineID  JOIN Users u  ON r.UserID = u.UserID where r.RecipeID = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            txtRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            lblCusine.DataBindings.Add("Text", dt, "CuisineDesc");
            txtCalories.DataBindings.Add("Text", dt, "Calories");
            txtRecipeImageName.DataBindings.Add("Text", dt, "RecipeImageName");
            lblUser.DataBindings.Add("Text", dt, "UserName");
            txtDraftDate.DataBindings.Add("Text", dt, "DraftDate");
            txtPublishDate.DataBindings.Add("Text", dt, "PublishDate");
            txtArchiveDate.DataBindings.Add("Text", dt, "ArchiveDate");
            this.Show();
        }

    }
}
