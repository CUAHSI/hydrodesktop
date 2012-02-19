﻿namespace DataImport.CommonPages
{
    partial class FieldPropertiesPage
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvPreview = new System.Windows.Forms.DataGridView();
            this.cmbDateTimeColumn = new System.Windows.Forms.ComboBox();
            this.lblDateTmeColumn = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPreview)).BeginInit();
            this.SuspendLayout();
            // 
            // Banner
            // 
            this.Banner.Size = new System.Drawing.Size(503, 64);
            this.Banner.Subtitle = "Specify properties of imported fields.";
            this.Banner.Title = "Properties of imported fields";
            // 
            // dgvPreview
            // 
            this.dgvPreview.AllowUserToAddRows = false;
            this.dgvPreview.AllowUserToDeleteRows = false;
            this.dgvPreview.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvPreview.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPreview.Location = new System.Drawing.Point(19, 109);
            this.dgvPreview.MultiSelect = false;
            this.dgvPreview.Name = "dgvPreview";
            this.dgvPreview.ReadOnly = true;
            this.dgvPreview.Size = new System.Drawing.Size(464, 214);
            this.dgvPreview.TabIndex = 1;
            // 
            // cmbDateTimeColumn
            // 
            this.cmbDateTimeColumn.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDateTimeColumn.FormattingEnabled = true;
            this.cmbDateTimeColumn.Location = new System.Drawing.Point(158, 75);
            this.cmbDateTimeColumn.Name = "cmbDateTimeColumn";
            this.cmbDateTimeColumn.Size = new System.Drawing.Size(146, 21);
            this.cmbDateTimeColumn.TabIndex = 2;
            // 
            // lblDateTmeColumn
            // 
            this.lblDateTmeColumn.AutoSize = true;
            this.lblDateTmeColumn.Location = new System.Drawing.Point(19, 78);
            this.lblDateTmeColumn.Name = "lblDateTmeColumn";
            this.lblDateTmeColumn.Size = new System.Drawing.Size(133, 13);
            this.lblDateTmeColumn.TabIndex = 3;
            this.lblDateTmeColumn.Text = "Specify Date/Time column";
            // 
            // FieldPropertiesPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lblDateTmeColumn);
            this.Controls.Add(this.dgvPreview);
            this.Controls.Add(this.cmbDateTimeColumn);
            this.Name = "FieldPropertiesPage";
            this.Size = new System.Drawing.Size(503, 349);
            this.SetActive += new System.ComponentModel.CancelEventHandler(this.FieldPropertiesPage_SetActive);
            this.WizardNext += new Wizard.UI.WizardPageEventHandler(this.FieldPropertiesPage_WizardNext);
            this.Controls.SetChildIndex(this.cmbDateTimeColumn, 0);
            this.Controls.SetChildIndex(this.dgvPreview, 0);
            this.Controls.SetChildIndex(this.lblDateTmeColumn, 0);
            this.Controls.SetChildIndex(this.Banner, 0);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPreview)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvPreview;
        private System.Windows.Forms.ComboBox cmbDateTimeColumn;
        private System.Windows.Forms.Label lblDateTmeColumn;
    }
}
