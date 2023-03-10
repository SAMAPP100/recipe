namespace RecipeWinForms
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.lblCaptionRecipeName = new System.Windows.Forms.Label();
            this.lblCaptionCuisine = new System.Windows.Forms.Label();
            this.lblCaptionCalories = new System.Windows.Forms.Label();
            this.lblCaptionDraftDate = new System.Windows.Forms.Label();
            this.lblCaptionPublishDate = new System.Windows.Forms.Label();
            this.lblCaptionArchiveDate = new System.Windows.Forms.Label();
            this.lblCaptionRecipeImageName = new System.Windows.Forms.Label();
            this.lblCaptionUser = new System.Windows.Forms.Label();
            this.lblCusine = new System.Windows.Forms.Label();
            this.lblUser = new System.Windows.Forms.Label();
            this.txtRecipeName = new System.Windows.Forms.TextBox();
            this.txtCalories = new System.Windows.Forms.TextBox();
            this.txtDraftDate = new System.Windows.Forms.TextBox();
            this.txtPublishDate = new System.Windows.Forms.TextBox();
            this.txtArchiveDate = new System.Windows.Forms.TextBox();
            this.txtRecipeImageName = new System.Windows.Forms.TextBox();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionRecipeName, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionCuisine, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionCalories, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionDraftDate, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionPublishDate, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionArchiveDate, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionRecipeImageName, 0, 6);
            this.tableLayoutPanel1.Controls.Add(this.lblCaptionUser, 0, 7);
            this.tableLayoutPanel1.Controls.Add(this.lblCusine, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblUser, 1, 7);
            this.tableLayoutPanel1.Controls.Add(this.txtRecipeName, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtCalories, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtDraftDate, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtPublishDate, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtArchiveDate, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.txtRecipeImageName, 1, 6);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 8;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 33F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 33F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 32F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 31F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 28F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 33F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 70F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(420, 361);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // lblCaptionRecipeName
            // 
            this.lblCaptionRecipeName.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionRecipeName.AutoSize = true;
            this.lblCaptionRecipeName.Location = new System.Drawing.Point(3, 7);
            this.lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            this.lblCaptionRecipeName.Size = new System.Drawing.Size(77, 15);
            this.lblCaptionRecipeName.TabIndex = 0;
            this.lblCaptionRecipeName.Text = "Recipe Name";
            // 
            // lblCaptionCuisine
            // 
            this.lblCaptionCuisine.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionCuisine.AutoSize = true;
            this.lblCaptionCuisine.Location = new System.Drawing.Point(3, 38);
            this.lblCaptionCuisine.Name = "lblCaptionCuisine";
            this.lblCaptionCuisine.Size = new System.Drawing.Size(49, 15);
            this.lblCaptionCuisine.TabIndex = 1;
            this.lblCaptionCuisine.Text = "Cuisine ";
            // 
            // lblCaptionCalories
            // 
            this.lblCaptionCalories.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionCalories.AutoSize = true;
            this.lblCaptionCalories.Location = new System.Drawing.Point(3, 71);
            this.lblCaptionCalories.Name = "lblCaptionCalories";
            this.lblCaptionCalories.Size = new System.Drawing.Size(49, 15);
            this.lblCaptionCalories.TabIndex = 2;
            this.lblCaptionCalories.Text = "Calories";
            // 
            // lblCaptionDraftDate
            // 
            this.lblCaptionDraftDate.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionDraftDate.AutoSize = true;
            this.lblCaptionDraftDate.Location = new System.Drawing.Point(3, 103);
            this.lblCaptionDraftDate.Name = "lblCaptionDraftDate";
            this.lblCaptionDraftDate.Size = new System.Drawing.Size(60, 15);
            this.lblCaptionDraftDate.TabIndex = 3;
            this.lblCaptionDraftDate.Text = "Draft Date";
            // 
            // lblCaptionPublishDate
            // 
            this.lblCaptionPublishDate.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionPublishDate.AutoSize = true;
            this.lblCaptionPublishDate.Location = new System.Drawing.Point(3, 135);
            this.lblCaptionPublishDate.Name = "lblCaptionPublishDate";
            this.lblCaptionPublishDate.Size = new System.Drawing.Size(73, 15);
            this.lblCaptionPublishDate.TabIndex = 4;
            this.lblCaptionPublishDate.Text = "Publish Date";
            // 
            // lblCaptionArchiveDate
            // 
            this.lblCaptionArchiveDate.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionArchiveDate.AutoSize = true;
            this.lblCaptionArchiveDate.Location = new System.Drawing.Point(3, 164);
            this.lblCaptionArchiveDate.Name = "lblCaptionArchiveDate";
            this.lblCaptionArchiveDate.Size = new System.Drawing.Size(71, 15);
            this.lblCaptionArchiveDate.TabIndex = 5;
            this.lblCaptionArchiveDate.Text = "ArchiveDate";
            // 
            // lblCaptionRecipeImageName
            // 
            this.lblCaptionRecipeImageName.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblCaptionRecipeImageName.AutoSize = true;
            this.lblCaptionRecipeImageName.Location = new System.Drawing.Point(3, 195);
            this.lblCaptionRecipeImageName.Name = "lblCaptionRecipeImageName";
            this.lblCaptionRecipeImageName.Size = new System.Drawing.Size(113, 15);
            this.lblCaptionRecipeImageName.TabIndex = 6;
            this.lblCaptionRecipeImageName.Text = "Recipe Image Name";
            // 
            // lblCaptionUser
            // 
            this.lblCaptionUser.AutoSize = true;
            this.lblCaptionUser.Location = new System.Drawing.Point(3, 219);
            this.lblCaptionUser.Name = "lblCaptionUser";
            this.lblCaptionUser.Size = new System.Drawing.Size(30, 15);
            this.lblCaptionUser.TabIndex = 7;
            this.lblCaptionUser.Text = "User";
            // 
            // lblCusine
            // 
            this.lblCusine.AutoSize = true;
            this.lblCusine.BackColor = System.Drawing.Color.WhiteSmoke;
            this.lblCusine.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblCusine.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblCusine.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCusine.Location = new System.Drawing.Point(122, 29);
            this.lblCusine.Name = "lblCusine";
            this.lblCusine.Size = new System.Drawing.Size(295, 33);
            this.lblCusine.TabIndex = 8;
            // 
            // lblUser
            // 
            this.lblUser.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblUser.BackColor = System.Drawing.Color.WhiteSmoke;
            this.lblUser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblUser.Location = new System.Drawing.Point(122, 219);
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(295, 29);
            this.lblUser.TabIndex = 9;
            // 
            // txtRecipeName
            // 
            this.txtRecipeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRecipeName.Location = new System.Drawing.Point(122, 3);
            this.txtRecipeName.Name = "txtRecipeName";
            this.txtRecipeName.Size = new System.Drawing.Size(295, 23);
            this.txtRecipeName.TabIndex = 10;
            // 
            // txtCalories
            // 
            this.txtCalories.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCalories.Location = new System.Drawing.Point(122, 65);
            this.txtCalories.Name = "txtCalories";
            this.txtCalories.Size = new System.Drawing.Size(295, 23);
            this.txtCalories.TabIndex = 11;
            // 
            // txtDraftDate
            // 
            this.txtDraftDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDraftDate.Location = new System.Drawing.Point(122, 98);
            this.txtDraftDate.Name = "txtDraftDate";
            this.txtDraftDate.Size = new System.Drawing.Size(295, 23);
            this.txtDraftDate.TabIndex = 12;
            // 
            // txtPublishDate
            // 
            this.txtPublishDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPublishDate.Location = new System.Drawing.Point(122, 130);
            this.txtPublishDate.Name = "txtPublishDate";
            this.txtPublishDate.Size = new System.Drawing.Size(295, 23);
            this.txtPublishDate.TabIndex = 13;
            // 
            // txtArchiveDate
            // 
            this.txtArchiveDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtArchiveDate.Location = new System.Drawing.Point(122, 161);
            this.txtArchiveDate.Name = "txtArchiveDate";
            this.txtArchiveDate.Size = new System.Drawing.Size(295, 23);
            this.txtArchiveDate.TabIndex = 14;
            // 
            // txtRecipeImageName
            // 
            this.txtRecipeImageName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRecipeImageName.Location = new System.Drawing.Point(122, 189);
            this.txtRecipeImageName.Name = "txtRecipeImageName";
            this.txtRecipeImageName.Size = new System.Drawing.Size(295, 23);
            this.txtRecipeImageName.TabIndex = 15;
            // 
            // frmRecipe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(420, 361);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "frmRecipe";
            this.Text = "Recipe";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tableLayoutPanel1;
        private Label lblCaptionRecipeName;
        private Label lblCaptionCuisine;
        private Label lblCaptionCalories;
        private Label lblCaptionDraftDate;
        private Label lblCaptionPublishDate;
        private Label lblCaptionArchiveDate;
        private Label lblCaptionRecipeImageName;
        private Label lblCaptionUser;
        private Label lblCusine;
        private Label lblUser;
        private TextBox txtRecipeName;
        private TextBox txtCalories;
        private TextBox txtDraftDate;
        private TextBox txtPublishDate;
        private TextBox txtArchiveDate;
        private TextBox txtRecipeImageName;
    }
}