using RecipeSystem;

namespace RecipeWinForms
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            DBManager.SetConnectionString("Server=.\\SQLExpress;Database=HeartyHearth;Trusted_Connection=true;");
            //SQLUtility.ConnectionString = "Server=.\\SQLExpress;Database=HeartyHearth;Trusted_Connection=true;";
            Application.Run(new frmSearch());
        }
    }
}