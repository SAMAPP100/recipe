using RecipeSystem;
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

            DataTable dt = Recipe.SearchRecipes(recipename);
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
