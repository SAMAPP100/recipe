using System.Data;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        DataTable dtrecipes = new DataTable();
        public frmRecipe()
        {
            InitializeComponent();
            btnSave.Click += BtnSave_Click;
            btnDelete.Click += BtnDelete_Click;
        }




        public void ShowForm(int recipeid)
        {

            dtrecipes = Recipe.Load(recipeid);
            if (recipeid == 0)
            {
                dtrecipes.Rows.Add();
            }
            DataTable tdcuisine = Recipe.GetCuisineList();
            WindowsFormsUtility.SetListBinding(lstCuisineDesc, tdcuisine, dtrecipes, "Cuisine");

            DataTable tdusers = Recipe.GetUsersList();
            WindowsFormsUtility.SetListBinding(lstUserName, tdusers, dtrecipes, "RUser");

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
            Application.UseWaitCursor = true;
            try
            {

                Recipe.Save(dtrecipes);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                Application.UseWaitCursor = false;
            }
        }

        private void Delete()
        {
            Application.UseWaitCursor = true;
            try
            {

                Recipe.Delete(dtrecipes);
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                Application.UseWaitCursor = false;
            }
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
