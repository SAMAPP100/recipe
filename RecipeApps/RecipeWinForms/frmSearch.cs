using CPUFrameWork;
using System.Data;

namespace RecipeWinForms
{
    public partial class frmSearch : Form
    {
        public frmSearch()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
            btnNew.Click += BtnNew_Click;
            gRecipes.CellDoubleClick += GRecipes_CellDoubleClick;
            FormatGrid();
        }



        private void SearchForRecipe(string recipename)
        {
            string sql = "SELECT r.RecipeName, r.RecipeID, c.CuisineDesc, u.UserName, r.Calories, r.CurrStatus, r.RecipeImageName  FROM Recipe r  JOIN Cuisine c   ON r.CuisineID = c.CuisineID  JOIN Users u  ON r.UserID = u.UserID where r.RecipeName like '%" + recipename + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            gRecipes.DataSource = dt;
            gRecipes.Columns["RecipeID"].Visible = false;
        }
        private void ShowRecipetForm(int rowindex)
        {
            int id = rowindex == -1 ? 0 : (int)gRecipes.Rows[rowindex].Cells["RecipeID"].Value;
            frmRecipe frm = new();
            frm.ShowForm(id);
        }
        private void FormatGrid()
        {
            gRecipes.AllowUserToAddRows = false;
            gRecipes.ReadOnly = true;
            gRecipes.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gRecipes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }
        private void GRecipes_CellDoubleClick(object? sender, DataGridViewCellEventArgs e)
        {
            ShowRecipetForm(e.RowIndex);
        }

        private void BtnSearch_Click(object? sender, EventArgs e)
        {
            SearchForRecipe(txtSearch.Text);
        }
        private void BtnNew_Click(object? sender, EventArgs e)
        {
            ShowRecipetForm(-1);
        }
    }
}
