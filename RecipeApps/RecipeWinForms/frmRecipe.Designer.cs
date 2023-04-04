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
            tableLayoutPanel1 = new TableLayoutPanel();
            lblCaptionRecipeName = new Label();
            lblCaptionCuisine = new Label();
            lblCaptionCalories = new Label();
            lblCaptionDraftDate = new Label();
            lblCaptionPublishDate = new Label();
            lblCaptionArchiveDate = new Label();
            lblCaptionRecipeImageName = new Label();
            lblCaptionUser = new Label();
            txtRecipeName = new TextBox();
            txtCalories = new TextBox();
            txtDraftDate = new TextBox();
            txtPublishDate = new TextBox();
            txtArchiveDate = new TextBox();
            txtRecipeImageName = new TextBox();
            tableLayoutPanel2 = new TableLayoutPanel();
            btnDelete = new Button();
            btnSave = new Button();
            lstCuisineDesc = new ComboBox();
            lstUserName = new ComboBox();
            tableLayoutPanel1.SuspendLayout();
            tableLayoutPanel2.SuspendLayout();
            SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            tableLayoutPanel1.ColumnCount = 2;
            tableLayoutPanel1.ColumnStyles.Add(new ColumnStyle());
            tableLayoutPanel1.ColumnStyles.Add(new ColumnStyle());
            tableLayoutPanel1.Controls.Add(lblCaptionRecipeName, 0, 0);
            tableLayoutPanel1.Controls.Add(lblCaptionCuisine, 0, 1);
            tableLayoutPanel1.Controls.Add(lblCaptionCalories, 0, 2);
            tableLayoutPanel1.Controls.Add(lblCaptionDraftDate, 0, 3);
            tableLayoutPanel1.Controls.Add(lblCaptionPublishDate, 0, 4);
            tableLayoutPanel1.Controls.Add(lblCaptionArchiveDate, 0, 5);
            tableLayoutPanel1.Controls.Add(lblCaptionRecipeImageName, 0, 6);
            tableLayoutPanel1.Controls.Add(lblCaptionUser, 0, 7);
            tableLayoutPanel1.Controls.Add(txtRecipeName, 1, 0);
            tableLayoutPanel1.Controls.Add(txtCalories, 1, 2);
            tableLayoutPanel1.Controls.Add(txtDraftDate, 1, 3);
            tableLayoutPanel1.Controls.Add(txtPublishDate, 1, 4);
            tableLayoutPanel1.Controls.Add(txtArchiveDate, 1, 5);
            tableLayoutPanel1.Controls.Add(txtRecipeImageName, 1, 6);
            tableLayoutPanel1.Controls.Add(tableLayoutPanel2, 1, 8);
            tableLayoutPanel1.Controls.Add(lstCuisineDesc, 1, 1);
            tableLayoutPanel1.Controls.Add(lstUserName, 1, 7);
            tableLayoutPanel1.Dock = DockStyle.Fill;
            tableLayoutPanel1.Location = new Point(0, 0);
            tableLayoutPanel1.Name = "tableLayoutPanel1";
            tableLayoutPanel1.RowCount = 9;
            tableLayoutPanel1.RowStyles.Add(new RowStyle());
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 33F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 33F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 32F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 31F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 28F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 33F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 30F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle());
            tableLayoutPanel1.Size = new Size(424, 282);
            tableLayoutPanel1.TabIndex = 0;
            // 
            // lblCaptionRecipeName
            // 
            lblCaptionRecipeName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeName.AutoSize = true;
            lblCaptionRecipeName.Location = new Point(3, 7);
            lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            lblCaptionRecipeName.Size = new Size(77, 15);
            lblCaptionRecipeName.TabIndex = 0;
            lblCaptionRecipeName.Text = "Recipe Name";
            // 
            // lblCaptionCuisine
            // 
            lblCaptionCuisine.Anchor = AnchorStyles.Left;
            lblCaptionCuisine.AutoSize = true;
            lblCaptionCuisine.Location = new Point(3, 38);
            lblCaptionCuisine.Name = "lblCaptionCuisine";
            lblCaptionCuisine.Size = new Size(49, 15);
            lblCaptionCuisine.TabIndex = 1;
            lblCaptionCuisine.Text = "Cuisine ";
            // 
            // lblCaptionCalories
            // 
            lblCaptionCalories.Anchor = AnchorStyles.Left;
            lblCaptionCalories.AutoSize = true;
            lblCaptionCalories.Location = new Point(3, 71);
            lblCaptionCalories.Name = "lblCaptionCalories";
            lblCaptionCalories.Size = new Size(49, 15);
            lblCaptionCalories.TabIndex = 2;
            lblCaptionCalories.Text = "Calories";
            // 
            // lblCaptionDraftDate
            // 
            lblCaptionDraftDate.Anchor = AnchorStyles.Left;
            lblCaptionDraftDate.AutoSize = true;
            lblCaptionDraftDate.Location = new Point(3, 103);
            lblCaptionDraftDate.Name = "lblCaptionDraftDate";
            lblCaptionDraftDate.Size = new Size(60, 15);
            lblCaptionDraftDate.TabIndex = 3;
            lblCaptionDraftDate.Text = "Draft Date";
            // 
            // lblCaptionPublishDate
            // 
            lblCaptionPublishDate.Anchor = AnchorStyles.Left;
            lblCaptionPublishDate.AutoSize = true;
            lblCaptionPublishDate.Location = new Point(3, 135);
            lblCaptionPublishDate.Name = "lblCaptionPublishDate";
            lblCaptionPublishDate.Size = new Size(73, 15);
            lblCaptionPublishDate.TabIndex = 4;
            lblCaptionPublishDate.Text = "Publish Date";
            // 
            // lblCaptionArchiveDate
            // 
            lblCaptionArchiveDate.Anchor = AnchorStyles.Left;
            lblCaptionArchiveDate.AutoSize = true;
            lblCaptionArchiveDate.Location = new Point(3, 164);
            lblCaptionArchiveDate.Name = "lblCaptionArchiveDate";
            lblCaptionArchiveDate.Size = new Size(71, 15);
            lblCaptionArchiveDate.TabIndex = 5;
            lblCaptionArchiveDate.Text = "ArchiveDate";
            // 
            // lblCaptionRecipeImageName
            // 
            lblCaptionRecipeImageName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeImageName.AutoSize = true;
            lblCaptionRecipeImageName.Location = new Point(3, 195);
            lblCaptionRecipeImageName.Name = "lblCaptionRecipeImageName";
            lblCaptionRecipeImageName.Size = new Size(113, 15);
            lblCaptionRecipeImageName.TabIndex = 6;
            lblCaptionRecipeImageName.Text = "Recipe Image Name";
            // 
            // lblCaptionUser
            // 
            lblCaptionUser.AutoSize = true;
            lblCaptionUser.Location = new Point(3, 219);
            lblCaptionUser.Name = "lblCaptionUser";
            lblCaptionUser.Size = new Size(30, 15);
            lblCaptionUser.TabIndex = 7;
            lblCaptionUser.Text = "User";
            // 
            // txtRecipeName
            // 
            txtRecipeName.Dock = DockStyle.Fill;
            txtRecipeName.Location = new Point(122, 3);
            txtRecipeName.Name = "txtRecipeName";
            txtRecipeName.Size = new Size(299, 23);
            txtRecipeName.TabIndex = 10;
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(122, 65);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(299, 23);
            txtCalories.TabIndex = 11;
            // 
            // txtDraftDate
            // 
            txtDraftDate.Dock = DockStyle.Fill;
            txtDraftDate.Location = new Point(122, 98);
            txtDraftDate.Name = "txtDraftDate";
            txtDraftDate.Size = new Size(299, 23);
            txtDraftDate.TabIndex = 12;
            // 
            // txtPublishDate
            // 
            txtPublishDate.Dock = DockStyle.Fill;
            txtPublishDate.Location = new Point(122, 130);
            txtPublishDate.Name = "txtPublishDate";
            txtPublishDate.Size = new Size(299, 23);
            txtPublishDate.TabIndex = 13;
            // 
            // txtArchiveDate
            // 
            txtArchiveDate.Dock = DockStyle.Fill;
            txtArchiveDate.Location = new Point(122, 161);
            txtArchiveDate.Name = "txtArchiveDate";
            txtArchiveDate.Size = new Size(299, 23);
            txtArchiveDate.TabIndex = 14;
            // 
            // txtRecipeImageName
            // 
            txtRecipeImageName.Dock = DockStyle.Fill;
            txtRecipeImageName.Location = new Point(122, 189);
            txtRecipeImageName.Name = "txtRecipeImageName";
            txtRecipeImageName.Size = new Size(299, 23);
            txtRecipeImageName.TabIndex = 15;
            // 
            // tableLayoutPanel2
            // 
            tableLayoutPanel2.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            tableLayoutPanel2.AutoSize = true;
            tableLayoutPanel2.ColumnCount = 2;
            tableLayoutPanel2.ColumnStyles.Add(new ColumnStyle());
            tableLayoutPanel2.ColumnStyles.Add(new ColumnStyle());
            tableLayoutPanel2.Controls.Add(btnDelete, 1, 0);
            tableLayoutPanel2.Controls.Add(btnSave, 0, 0);
            tableLayoutPanel2.Location = new Point(259, 252);
            tableLayoutPanel2.Name = "tableLayoutPanel2";
            tableLayoutPanel2.RowCount = 1;
            tableLayoutPanel2.RowStyles.Add(new RowStyle());
            tableLayoutPanel2.Size = new Size(162, 29);
            tableLayoutPanel2.TabIndex = 16;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(84, 3);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(75, 23);
            btnDelete.TabIndex = 0;
            btnDelete.Text = "Delete";
            btnDelete.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            btnSave.Location = new Point(3, 3);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(75, 23);
            btnSave.TabIndex = 1;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = true;
            // 
            // lstCuisineDesc
            // 
            lstCuisineDesc.FormattingEnabled = true;
            lstCuisineDesc.Location = new Point(122, 32);
            lstCuisineDesc.Name = "lstCuisineDesc";
            lstCuisineDesc.Size = new Size(156, 23);
            lstCuisineDesc.TabIndex = 17;
            // 
            // lstUserName
            // 
            lstUserName.FormattingEnabled = true;
            lstUserName.Location = new Point(122, 222);
            lstUserName.Name = "lstUserName";
            lstUserName.Size = new Size(156, 23);
            lstUserName.TabIndex = 18;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(424, 282);
            Controls.Add(tableLayoutPanel1);
            Name = "frmRecipe";
            Text = "Recipe";
            tableLayoutPanel1.ResumeLayout(false);
            tableLayoutPanel1.PerformLayout();
            tableLayoutPanel2.ResumeLayout(false);
            ResumeLayout(false);
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
        private TextBox txtRecipeName;
        private TextBox txtCalories;
        private TextBox txtDraftDate;
        private TextBox txtPublishDate;
        private TextBox txtArchiveDate;
        private TextBox txtRecipeImageName;
        private TableLayoutPanel tableLayoutPanel2;
        private Button btnDelete;
        private Button btnSave;
        private ComboBox lstCuisineDesc;
        private ComboBox lstUserName;
    }
}