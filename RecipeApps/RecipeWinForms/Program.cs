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
            //DBManager.SetConnectionString("Server=.\\SQLExpress;Database=HeartyHearth;Trusted_Connection=true;");
            DBManager.SetConnectionString("Server= webprogram.app,2997;Database=HeartyHearth;User id=SamB;Password=62FileyAv;");
            Application.Run(new frmSearch());
        }
    }
}