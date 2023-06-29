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
            //AF When I tried to run the program, it crashed on this line.  When submitting HW, this connection string should be commented out if it's not valid for HW markers
            //DBManager.SetConnectionString("Server= webprogram.app,2997;Database=HeartyHearth;User id=SamB;Password=62FileyAv;");
            Application.Run(new frmSearch());
        }
    }
}