namespace IntelligentHome
{
    partial class FormMain
    {
        /// <summary>
        /// Variabile di progettazione necessaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Pulire le risorse in uso.
        /// </summary>
        /// <param name="disposing">ha valore true se le risorse gestite devono essere eliminate, false in caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Codice generato da Progettazione Windows Form

        /// <summary>
        /// Metodo necessario per il supporto della finestra di progettazione. Non modificare
        /// il contenuto del metodo con l'editor di codice.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.gbLuceCamera1 = new System.Windows.Forms.GroupBox();
            this.bInviaTempCamera1 = new System.Windows.Forms.Button();
            this.HeatUnitCamera1 = new System.Windows.Forms.PictureBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.TempCamera1 = new System.Windows.Forms.NumericUpDown();
            this.label7 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.TermostatoCamera1 = new System.Windows.Forms.NumericUpDown();
            this.gbLuceBagno = new System.Windows.Forms.GroupBox();
            this.bInviaTempBagno = new System.Windows.Forms.Button();
            this.HeatUnitBagno = new System.Windows.Forms.PictureBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.TempBagno = new System.Windows.Forms.NumericUpDown();
            this.label8 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.TermostatoBagno = new System.Windows.Forms.NumericUpDown();
            this.gbLuceCamera2 = new System.Windows.Forms.GroupBox();
            this.bInviaTempCamera2 = new System.Windows.Forms.Button();
            this.HeatUnitCamera2 = new System.Windows.Forms.PictureBox();
            this.label15 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.TempCamera2 = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.TermostatoCamera2 = new System.Windows.Forms.NumericUpDown();
            this.gbLuceSalone = new System.Windows.Forms.GroupBox();
            this.bInviaTempSalone = new System.Windows.Forms.Button();
            this.label22 = new System.Windows.Forms.Label();
            this.CrepuscolareSalone = new System.Windows.Forms.TrackBar();
            this.HeatUnitSalone = new System.Windows.Forms.PictureBox();
            this.label17 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.TempSalone = new System.Windows.Forms.NumericUpDown();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.TermostatoSalone = new System.Windows.Forms.NumericUpDown();
            this.gbLuceCucina = new System.Windows.Forms.GroupBox();
            this.bInviaTempCucina = new System.Windows.Forms.Button();
            this.FinestraCucina = new System.Windows.Forms.PictureBox();
            this.GasCucina = new System.Windows.Forms.CheckBox();
            this.HeatUnitCucina = new System.Windows.Forms.PictureBox();
            this.label19 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.TempCucina = new System.Windows.Forms.NumericUpDown();
            this.label10 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.TermostatoCucina = new System.Windows.Forms.NumericUpDown();
            this.rtbLog = new System.Windows.Forms.RichTextBox();
            this.lLog = new System.Windows.Forms.Label();
            this.cbEsci = new System.Windows.Forms.CheckBox();
            this.LCD = new LCDLabel.LcdLabel();
            this.label21 = new System.Windows.Forms.Label();
            this.timerThermo = new System.Windows.Forms.Timer(this.components);
            this.PortaCasaAperta = new System.Windows.Forms.CheckBox();
            this.timerLCD = new System.Windows.Forms.Timer(this.components);
            this.bActivate = new System.Windows.Forms.Button();
            this.bInviaFake = new System.Windows.Forms.Button();
            this.bInviaUnknown = new System.Windows.Forms.Button();
            this.gbLuceCamera1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCamera1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCamera1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCamera1)).BeginInit();
            this.gbLuceBagno.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitBagno)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempBagno)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoBagno)).BeginInit();
            this.gbLuceCamera2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCamera2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCamera2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCamera2)).BeginInit();
            this.gbLuceSalone.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CrepuscolareSalone)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitSalone)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempSalone)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoSalone)).BeginInit();
            this.gbLuceCucina.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.FinestraCucina)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCucina)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCucina)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCucina)).BeginInit();
            this.SuspendLayout();
            // 
            // gbLuceCamera1
            // 
            this.gbLuceCamera1.Controls.Add(this.bInviaFake);
            this.gbLuceCamera1.Controls.Add(this.bInviaTempCamera1);
            this.gbLuceCamera1.Controls.Add(this.HeatUnitCamera1);
            this.gbLuceCamera1.Controls.Add(this.label11);
            this.gbLuceCamera1.Controls.Add(this.label12);
            this.gbLuceCamera1.Controls.Add(this.TempCamera1);
            this.gbLuceCamera1.Controls.Add(this.label7);
            this.gbLuceCamera1.Controls.Add(this.label1);
            this.gbLuceCamera1.Controls.Add(this.TermostatoCamera1);
            this.gbLuceCamera1.Location = new System.Drawing.Point(44, 77);
            this.gbLuceCamera1.Name = "gbLuceCamera1";
            this.gbLuceCamera1.Size = new System.Drawing.Size(220, 155);
            this.gbLuceCamera1.TabIndex = 0;
            this.gbLuceCamera1.TabStop = false;
            this.gbLuceCamera1.Text = "Camera 1";
            // 
            // bInviaTempCamera1
            // 
            this.bInviaTempCamera1.Location = new System.Drawing.Point(9, 85);
            this.bInviaTempCamera1.Name = "bInviaTempCamera1";
            this.bInviaTempCamera1.Size = new System.Drawing.Size(61, 20);
            this.bInviaTempCamera1.TabIndex = 19;
            this.bInviaTempCamera1.Text = "Invia °C";
            this.bInviaTempCamera1.UseVisualStyleBackColor = true;
            this.bInviaTempCamera1.Click += new System.EventHandler(this.button2_Click);
            // 
            // HeatUnitCamera1
            // 
            this.HeatUnitCamera1.Image = global::IntelligentHome.Properties.Resources.FlameOff;
            this.HeatUnitCamera1.Location = new System.Drawing.Point(191, 125);
            this.HeatUnitCamera1.Name = "HeatUnitCamera1";
            this.HeatUnitCamera1.Size = new System.Drawing.Size(19, 21);
            this.HeatUnitCamera1.TabIndex = 19;
            this.HeatUnitCamera1.TabStop = false;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(4, 108);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(67, 13);
            this.label11.TabIndex = 14;
            this.label11.Text = "Temperatura";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(74, 127);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(18, 13);
            this.label12.TabIndex = 13;
            this.label12.Text = "°C";
            // 
            // TempCamera1
            // 
            this.TempCamera1.DecimalPlaces = 1;
            this.TempCamera1.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TempCamera1.Location = new System.Drawing.Point(7, 124);
            this.TempCamera1.Name = "TempCamera1";
            this.TempCamera1.Size = new System.Drawing.Size(63, 20);
            this.TempCamera1.TabIndex = 12;
            this.TempCamera1.Value = new decimal(new int[] {
            210,
            0,
            0,
            65536});
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(97, 109);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(60, 13);
            this.label7.TabIndex = 11;
            this.label7.Text = "Termostato";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(167, 128);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(18, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "°C";
            // 
            // TermostatoCamera1
            // 
            this.TermostatoCamera1.DecimalPlaces = 1;
            this.TermostatoCamera1.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TermostatoCamera1.Location = new System.Drawing.Point(100, 125);
            this.TermostatoCamera1.Name = "TermostatoCamera1";
            this.TermostatoCamera1.Size = new System.Drawing.Size(63, 20);
            this.TermostatoCamera1.TabIndex = 4;
            this.TermostatoCamera1.Value = new decimal(new int[] {
            195,
            0,
            0,
            65536});
            this.TermostatoCamera1.ValueChanged += new System.EventHandler(this.nTermostatoCamera1_ValueChanged);
            // 
            // gbLuceBagno
            // 
            this.gbLuceBagno.Controls.Add(this.bInviaTempBagno);
            this.gbLuceBagno.Controls.Add(this.HeatUnitBagno);
            this.gbLuceBagno.Controls.Add(this.label13);
            this.gbLuceBagno.Controls.Add(this.label14);
            this.gbLuceBagno.Controls.Add(this.TempBagno);
            this.gbLuceBagno.Controls.Add(this.label8);
            this.gbLuceBagno.Controls.Add(this.label2);
            this.gbLuceBagno.Controls.Add(this.TermostatoBagno);
            this.gbLuceBagno.Location = new System.Drawing.Point(270, 77);
            this.gbLuceBagno.Name = "gbLuceBagno";
            this.gbLuceBagno.Size = new System.Drawing.Size(123, 155);
            this.gbLuceBagno.TabIndex = 1;
            this.gbLuceBagno.TabStop = false;
            this.gbLuceBagno.Text = "Bagno";
            // 
            // bInviaTempBagno
            // 
            this.bInviaTempBagno.Location = new System.Drawing.Point(9, 41);
            this.bInviaTempBagno.Name = "bInviaTempBagno";
            this.bInviaTempBagno.Size = new System.Drawing.Size(61, 20);
            this.bInviaTempBagno.TabIndex = 20;
            this.bInviaTempBagno.Text = "Invia °C";
            this.bInviaTempBagno.UseVisualStyleBackColor = true;
            this.bInviaTempBagno.Click += new System.EventHandler(this.bInviaTempBagno_Click);
            // 
            // HeatUnitBagno
            // 
            this.HeatUnitBagno.Image = global::IntelligentHome.Properties.Resources.FlameOff;
            this.HeatUnitBagno.Location = new System.Drawing.Point(98, 124);
            this.HeatUnitBagno.Name = "HeatUnitBagno";
            this.HeatUnitBagno.Size = new System.Drawing.Size(19, 21);
            this.HeatUnitBagno.TabIndex = 19;
            this.HeatUnitBagno.TabStop = false;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(6, 64);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(67, 13);
            this.label13.TabIndex = 17;
            this.label13.Text = "Temperatura";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(73, 83);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(18, 13);
            this.label14.TabIndex = 16;
            this.label14.Text = "°C";
            // 
            // TempBagno
            // 
            this.TempBagno.DecimalPlaces = 1;
            this.TempBagno.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TempBagno.Location = new System.Drawing.Point(9, 81);
            this.TempBagno.Name = "TempBagno";
            this.TempBagno.Size = new System.Drawing.Size(63, 20);
            this.TempBagno.TabIndex = 15;
            this.TempBagno.Value = new decimal(new int[] {
            208,
            0,
            0,
            65536});
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 108);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(60, 13);
            this.label8.TabIndex = 11;
            this.label8.Text = "Termostato";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(76, 128);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(18, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "°C";
            // 
            // TermostatoBagno
            // 
            this.TermostatoBagno.DecimalPlaces = 1;
            this.TermostatoBagno.Increment = new decimal(new int[] {
            5,
            0,
            0,
            65536});
            this.TermostatoBagno.Location = new System.Drawing.Point(9, 124);
            this.TermostatoBagno.Name = "TermostatoBagno";
            this.TermostatoBagno.Size = new System.Drawing.Size(63, 20);
            this.TermostatoBagno.TabIndex = 5;
            this.TermostatoBagno.Value = new decimal(new int[] {
            21,
            0,
            0,
            0});
            // 
            // gbLuceCamera2
            // 
            this.gbLuceCamera2.Controls.Add(this.bInviaTempCamera2);
            this.gbLuceCamera2.Controls.Add(this.HeatUnitCamera2);
            this.gbLuceCamera2.Controls.Add(this.label15);
            this.gbLuceCamera2.Controls.Add(this.label16);
            this.gbLuceCamera2.Controls.Add(this.TempCamera2);
            this.gbLuceCamera2.Controls.Add(this.label9);
            this.gbLuceCamera2.Controls.Add(this.label3);
            this.gbLuceCamera2.Controls.Add(this.TermostatoCamera2);
            this.gbLuceCamera2.Location = new System.Drawing.Point(399, 77);
            this.gbLuceCamera2.Name = "gbLuceCamera2";
            this.gbLuceCamera2.Size = new System.Drawing.Size(200, 155);
            this.gbLuceCamera2.TabIndex = 2;
            this.gbLuceCamera2.TabStop = false;
            this.gbLuceCamera2.Text = "Camera 2";
            // 
            // bInviaTempCamera2
            // 
            this.bInviaTempCamera2.Location = new System.Drawing.Point(6, 86);
            this.bInviaTempCamera2.Name = "bInviaTempCamera2";
            this.bInviaTempCamera2.Size = new System.Drawing.Size(61, 20);
            this.bInviaTempCamera2.TabIndex = 20;
            this.bInviaTempCamera2.Text = "Invia °C";
            this.bInviaTempCamera2.UseVisualStyleBackColor = true;
            this.bInviaTempCamera2.Click += new System.EventHandler(this.bInviaTempCamera2_Click);
            // 
            // HeatUnitCamera2
            // 
            this.HeatUnitCamera2.Image = global::IntelligentHome.Properties.Resources.FlameOff;
            this.HeatUnitCamera2.Location = new System.Drawing.Point(171, 125);
            this.HeatUnitCamera2.Name = "HeatUnitCamera2";
            this.HeatUnitCamera2.Size = new System.Drawing.Size(19, 21);
            this.HeatUnitCamera2.TabIndex = 19;
            this.HeatUnitCamera2.TabStop = false;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(6, 109);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(67, 13);
            this.label15.TabIndex = 17;
            this.label15.Text = "Temperatura";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(62, 128);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(18, 13);
            this.label16.TabIndex = 16;
            this.label16.Text = "°C";
            // 
            // TempCamera2
            // 
            this.TempCamera2.DecimalPlaces = 1;
            this.TempCamera2.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TempCamera2.Location = new System.Drawing.Point(9, 125);
            this.TempCamera2.Name = "TempCamera2";
            this.TempCamera2.Size = new System.Drawing.Size(51, 20);
            this.TempCamera2.TabIndex = 15;
            this.TempCamera2.Value = new decimal(new int[] {
            195,
            0,
            0,
            65536});
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(87, 109);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(60, 13);
            this.label9.TabIndex = 11;
            this.label9.Text = "Termostato";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(147, 129);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(18, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "°C";
            // 
            // TermostatoCamera2
            // 
            this.TermostatoCamera2.DecimalPlaces = 1;
            this.TermostatoCamera2.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TermostatoCamera2.Location = new System.Drawing.Point(90, 125);
            this.TermostatoCamera2.Name = "TermostatoCamera2";
            this.TermostatoCamera2.Size = new System.Drawing.Size(55, 20);
            this.TermostatoCamera2.TabIndex = 6;
            this.TermostatoCamera2.Value = new decimal(new int[] {
            195,
            0,
            0,
            65536});
            // 
            // gbLuceSalone
            // 
            this.gbLuceSalone.Controls.Add(this.bInviaTempSalone);
            this.gbLuceSalone.Controls.Add(this.label22);
            this.gbLuceSalone.Controls.Add(this.CrepuscolareSalone);
            this.gbLuceSalone.Controls.Add(this.HeatUnitSalone);
            this.gbLuceSalone.Controls.Add(this.label17);
            this.gbLuceSalone.Controls.Add(this.label18);
            this.gbLuceSalone.Controls.Add(this.TempSalone);
            this.gbLuceSalone.Controls.Add(this.label6);
            this.gbLuceSalone.Controls.Add(this.label4);
            this.gbLuceSalone.Controls.Add(this.TermostatoSalone);
            this.gbLuceSalone.Location = new System.Drawing.Point(45, 241);
            this.gbLuceSalone.Name = "gbLuceSalone";
            this.gbLuceSalone.Size = new System.Drawing.Size(348, 152);
            this.gbLuceSalone.TabIndex = 3;
            this.gbLuceSalone.TabStop = false;
            this.gbLuceSalone.Text = "Salone";
            // 
            // bInviaTempSalone
            // 
            this.bInviaTempSalone.Location = new System.Drawing.Point(9, 73);
            this.bInviaTempSalone.Name = "bInviaTempSalone";
            this.bInviaTempSalone.Size = new System.Drawing.Size(61, 20);
            this.bInviaTempSalone.TabIndex = 21;
            this.bInviaTempSalone.Text = "Invia °C";
            this.bInviaTempSalone.UseVisualStyleBackColor = true;
            this.bInviaTempSalone.Click += new System.EventHandler(this.bInviaTempSalone_Click);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(150, 16);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(95, 13);
            this.label22.TabIndex = 20;
            this.label22.Text = "Crepuscolare (Lux)";
            // 
            // CrepuscolareSalone
            // 
            this.CrepuscolareSalone.LargeChange = 2;
            this.CrepuscolareSalone.Location = new System.Drawing.Point(148, 32);
            this.CrepuscolareSalone.Name = "CrepuscolareSalone";
            this.CrepuscolareSalone.Size = new System.Drawing.Size(196, 45);
            this.CrepuscolareSalone.TabIndex = 19;
            this.CrepuscolareSalone.Value = 5;
            this.CrepuscolareSalone.ValueChanged += new System.EventHandler(this.tbCrepuscolareSalone_ValueChanged);
            // 
            // HeatUnitSalone
            // 
            this.HeatUnitSalone.Image = global::IntelligentHome.Properties.Resources.FlameOff;
            this.HeatUnitSalone.Location = new System.Drawing.Point(190, 121);
            this.HeatUnitSalone.Name = "HeatUnitSalone";
            this.HeatUnitSalone.Size = new System.Drawing.Size(19, 21);
            this.HeatUnitSalone.TabIndex = 18;
            this.HeatUnitSalone.TabStop = false;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(5, 103);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(67, 13);
            this.label17.TabIndex = 17;
            this.label17.Text = "Temperatura";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(75, 122);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(18, 13);
            this.label18.TabIndex = 16;
            this.label18.Text = "°C";
            // 
            // TempSalone
            // 
            this.TempSalone.DecimalPlaces = 1;
            this.TempSalone.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TempSalone.Location = new System.Drawing.Point(8, 119);
            this.TempSalone.Name = "TempSalone";
            this.TempSalone.Size = new System.Drawing.Size(63, 20);
            this.TempSalone.TabIndex = 15;
            this.TempSalone.Value = new decimal(new int[] {
            21,
            0,
            0,
            0});
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(96, 103);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Termostato";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(168, 123);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(18, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "°C";
            // 
            // TermostatoSalone
            // 
            this.TermostatoSalone.DecimalPlaces = 1;
            this.TermostatoSalone.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TermostatoSalone.Location = new System.Drawing.Point(99, 119);
            this.TermostatoSalone.Name = "TermostatoSalone";
            this.TermostatoSalone.Size = new System.Drawing.Size(63, 20);
            this.TermostatoSalone.TabIndex = 3;
            this.TermostatoSalone.Value = new decimal(new int[] {
            21,
            0,
            0,
            0});
            // 
            // gbLuceCucina
            // 
            this.gbLuceCucina.Controls.Add(this.bInviaTempCucina);
            this.gbLuceCucina.Controls.Add(this.FinestraCucina);
            this.gbLuceCucina.Controls.Add(this.GasCucina);
            this.gbLuceCucina.Controls.Add(this.HeatUnitCucina);
            this.gbLuceCucina.Controls.Add(this.label19);
            this.gbLuceCucina.Controls.Add(this.label20);
            this.gbLuceCucina.Controls.Add(this.TempCucina);
            this.gbLuceCucina.Controls.Add(this.label10);
            this.gbLuceCucina.Controls.Add(this.label5);
            this.gbLuceCucina.Controls.Add(this.TermostatoCucina);
            this.gbLuceCucina.Location = new System.Drawing.Point(399, 241);
            this.gbLuceCucina.Name = "gbLuceCucina";
            this.gbLuceCucina.Size = new System.Drawing.Size(200, 152);
            this.gbLuceCucina.TabIndex = 4;
            this.gbLuceCucina.TabStop = false;
            this.gbLuceCucina.Text = "Cucina";
            // 
            // bInviaTempCucina
            // 
            this.bInviaTempCucina.Location = new System.Drawing.Point(6, 69);
            this.bInviaTempCucina.Name = "bInviaTempCucina";
            this.bInviaTempCucina.Size = new System.Drawing.Size(61, 20);
            this.bInviaTempCucina.TabIndex = 22;
            this.bInviaTempCucina.Text = "Invia °C";
            this.bInviaTempCucina.UseVisualStyleBackColor = true;
            this.bInviaTempCucina.Click += new System.EventHandler(this.bInviaTempCucina_Click);
            // 
            // FinestraCucina
            // 
            this.FinestraCucina.Image = global::IntelligentHome.Properties.Resources.DoorOff;
            this.FinestraCucina.InitialImage = global::IntelligentHome.Properties.Resources.DoorOff;
            this.FinestraCucina.Location = new System.Drawing.Point(120, 69);
            this.FinestraCucina.Name = "FinestraCucina";
            this.FinestraCucina.Size = new System.Drawing.Size(69, 73);
            this.FinestraCucina.TabIndex = 21;
            this.FinestraCucina.TabStop = false;
            // 
            // GasCucina
            // 
            this.GasCucina.AutoSize = true;
            this.GasCucina.Location = new System.Drawing.Point(69, 123);
            this.GasCucina.Name = "GasCucina";
            this.GasCucina.Size = new System.Drawing.Size(45, 17);
            this.GasCucina.TabIndex = 20;
            this.GasCucina.Text = "Gas";
            this.GasCucina.UseVisualStyleBackColor = true;
            this.GasCucina.CheckedChanged += new System.EventHandler(this.cbGasCucina_CheckedChanged);
            // 
            // HeatUnitCucina
            // 
            this.HeatUnitCucina.Image = global::IntelligentHome.Properties.Resources.FlameOff;
            this.HeatUnitCucina.Location = new System.Drawing.Point(171, 34);
            this.HeatUnitCucina.Name = "HeatUnitCucina";
            this.HeatUnitCucina.Size = new System.Drawing.Size(19, 21);
            this.HeatUnitCucina.TabIndex = 19;
            this.HeatUnitCucina.TabStop = false;
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(6, 19);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(67, 13);
            this.label19.TabIndex = 17;
            this.label19.Text = "Temperatura";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(66, 40);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(18, 13);
            this.label20.TabIndex = 16;
            this.label20.Text = "°C";
            // 
            // TempCucina
            // 
            this.TempCucina.DecimalPlaces = 1;
            this.TempCucina.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TempCucina.Location = new System.Drawing.Point(9, 35);
            this.TempCucina.Name = "TempCucina";
            this.TempCucina.Size = new System.Drawing.Size(51, 20);
            this.TempCucina.TabIndex = 15;
            this.TempCucina.Value = new decimal(new int[] {
            20,
            0,
            0,
            0});
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(90, 19);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(60, 13);
            this.label10.TabIndex = 11;
            this.label10.Text = "Termostato";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(147, 40);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(18, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "°C";
            // 
            // TermostatoCucina
            // 
            this.TermostatoCucina.DecimalPlaces = 1;
            this.TermostatoCucina.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.TermostatoCucina.Location = new System.Drawing.Point(90, 35);
            this.TermostatoCucina.Name = "TermostatoCucina";
            this.TermostatoCucina.Size = new System.Drawing.Size(51, 20);
            this.TermostatoCucina.TabIndex = 6;
            this.TermostatoCucina.Value = new decimal(new int[] {
            20,
            0,
            0,
            0});
            // 
            // rtbLog
            // 
            this.rtbLog.Location = new System.Drawing.Point(44, 517);
            this.rtbLog.Name = "rtbLog";
            this.rtbLog.Size = new System.Drawing.Size(555, 84);
            this.rtbLog.TabIndex = 5;
            this.rtbLog.Text = "";
            // 
            // lLog
            // 
            this.lLog.AutoSize = true;
            this.lLog.Location = new System.Drawing.Point(42, 501);
            this.lLog.Name = "lLog";
            this.lLog.Size = new System.Drawing.Size(25, 13);
            this.lLog.TabIndex = 6;
            this.lLog.Text = "Log";
            // 
            // cbEsci
            // 
            this.cbEsci.Appearance = System.Windows.Forms.Appearance.Button;
            this.cbEsci.AutoSize = true;
            this.cbEsci.Location = new System.Drawing.Point(525, 454);
            this.cbEsci.Name = "cbEsci";
            this.cbEsci.Size = new System.Drawing.Size(88, 23);
            this.cbEsci.TabIndex = 7;
            this.cbEsci.Text = "Uscita da casa";
            this.cbEsci.UseVisualStyleBackColor = true;
            this.cbEsci.CheckedChanged += new System.EventHandler(this.cbEsci_CheckedChanged);
            // 
            // LCD
            // 
            this.LCD.BackGround = System.Drawing.Color.Black;
            this.LCD.BorderColor = System.Drawing.Color.Black;
            this.LCD.BorderSpace = 3;
            this.LCD.CharSpacing = 2;
            this.LCD.DotMatrix = LCDLabel.DotMatrix.mat5x7;
            this.LCD.LineSpacing = 2;
            this.LCD.Location = new System.Drawing.Point(44, 419);
            this.LCD.Name = "LCD";
            this.LCD.NumberOfCharacters = 28;
            this.LCD.PixelHeight = 2;
            this.LCD.PixelOff = System.Drawing.Color.Green;
            this.LCD.PixelOn = System.Drawing.Color.Lime;
            this.LCD.PixelShape = LCDLabel.PixelShape.Square;
            this.LCD.PixelSize = LCDLabel.PixelSize.pix2x2;
            this.LCD.PixelSpacing = 1;
            this.LCD.PixelWidth = 2;
            this.LCD.Size = new System.Drawing.Size(454, 72);
            this.LCD.TabIndex = 9;
            this.LCD.TextLines = 3;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(42, 403);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(78, 13);
            this.label21.TabIndex = 10;
            this.label21.Text = "LCD Centralina";
            // 
            // timerThermo
            // 
            this.timerThermo.Enabled = true;
            this.timerThermo.Interval = 3000;
            this.timerThermo.Tick += new System.EventHandler(this.timerCamera1_Tick);
            // 
            // PortaCasaAperta
            // 
            this.PortaCasaAperta.AutoSize = true;
            this.PortaCasaAperta.Location = new System.Drawing.Point(513, 431);
            this.PortaCasaAperta.Name = "PortaCasaAperta";
            this.PortaCasaAperta.Size = new System.Drawing.Size(110, 17);
            this.PortaCasaAperta.TabIndex = 11;
            this.PortaCasaAperta.Text = "Porta casa aperta";
            this.PortaCasaAperta.UseVisualStyleBackColor = true;
            this.PortaCasaAperta.CheckedChanged += new System.EventHandler(this.cbPortaCasaAperta_CheckedChanged);
            // 
            // timerLCD
            // 
            this.timerLCD.Enabled = true;
            this.timerLCD.Interval = 2000;
            this.timerLCD.Tick += new System.EventHandler(this.timerLCD_Tick);
            // 
            // bActivate
            // 
            this.bActivate.Location = new System.Drawing.Point(185, 19);
            this.bActivate.Name = "bActivate";
            this.bActivate.Size = new System.Drawing.Size(313, 23);
            this.bActivate.TabIndex = 12;
            this.bActivate.Text = "Attiva Sistema";
            this.bActivate.UseVisualStyleBackColor = true;
            this.bActivate.Click += new System.EventHandler(this.bActivate_Click);
            // 
            // bInviaFake
            // 
            this.bInviaFake.Location = new System.Drawing.Point(9, 54);
            this.bInviaFake.Name = "bInviaFake";
            this.bInviaFake.Size = new System.Drawing.Size(75, 23);
            this.bInviaFake.TabIndex = 20;
            this.bInviaFake.Text = "Invia fake";
            this.bInviaFake.UseVisualStyleBackColor = true;
            this.bInviaFake.Click += new System.EventHandler(this.bInviaFake_Click);
            // 
            // bInviaUnknown
            // 
            this.bInviaUnknown.Location = new System.Drawing.Point(41, 30);
            this.bInviaUnknown.Name = "bInviaUnknown";
            this.bInviaUnknown.Size = new System.Drawing.Size(108, 23);
            this.bInviaUnknown.TabIndex = 21;
            this.bInviaUnknown.Text = "Invia sconosciuto";
            this.bInviaUnknown.UseVisualStyleBackColor = true;
            this.bInviaUnknown.Click += new System.EventHandler(this.bInviaUnknown_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(649, 627);
            this.Controls.Add(this.bInviaUnknown);
            this.Controls.Add(this.bActivate);
            this.Controls.Add(this.PortaCasaAperta);
            this.Controls.Add(this.label21);
            this.Controls.Add(this.LCD);
            this.Controls.Add(this.cbEsci);
            this.Controls.Add(this.lLog);
            this.Controls.Add(this.rtbLog);
            this.Controls.Add(this.gbLuceCucina);
            this.Controls.Add(this.gbLuceSalone);
            this.Controls.Add(this.gbLuceCamera2);
            this.Controls.Add(this.gbLuceBagno);
            this.Controls.Add(this.gbLuceCamera1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMain";
            this.Text = "Intelligent Home";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormMain_FormClosing);
            this.gbLuceCamera1.ResumeLayout(false);
            this.gbLuceCamera1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCamera1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCamera1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCamera1)).EndInit();
            this.gbLuceBagno.ResumeLayout(false);
            this.gbLuceBagno.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitBagno)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempBagno)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoBagno)).EndInit();
            this.gbLuceCamera2.ResumeLayout(false);
            this.gbLuceCamera2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCamera2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCamera2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCamera2)).EndInit();
            this.gbLuceSalone.ResumeLayout(false);
            this.gbLuceSalone.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CrepuscolareSalone)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitSalone)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempSalone)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoSalone)).EndInit();
            this.gbLuceCucina.ResumeLayout(false);
            this.gbLuceCucina.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.FinestraCucina)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.HeatUnitCucina)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TempCucina)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TermostatoCucina)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox gbLuceCamera1;
        private System.Windows.Forms.GroupBox gbLuceBagno;
        private System.Windows.Forms.GroupBox gbLuceCamera2;
        private System.Windows.Forms.GroupBox gbLuceSalone;
        private System.Windows.Forms.GroupBox gbLuceCucina;
        private System.Windows.Forms.RichTextBox rtbLog;
        private System.Windows.Forms.Label lLog;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown TermostatoCamera1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown TermostatoBagno;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.NumericUpDown TermostatoCamera2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown TermostatoSalone;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.NumericUpDown TermostatoCucina;
        private System.Windows.Forms.CheckBox cbEsci;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.NumericUpDown TempCamera1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.NumericUpDown TempBagno;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.NumericUpDown TempCamera2;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.NumericUpDown TempSalone;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.NumericUpDown TempCucina;
        private System.Windows.Forms.PictureBox HeatUnitCamera1;
        private System.Windows.Forms.PictureBox HeatUnitBagno;
        private System.Windows.Forms.PictureBox HeatUnitCamera2;
        private System.Windows.Forms.PictureBox HeatUnitSalone;
        private System.Windows.Forms.PictureBox HeatUnitCucina;
        private System.Windows.Forms.Button bInviaTempCamera1;
        private LCDLabel.LcdLabel LCD;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.PictureBox FinestraCucina;
        private System.Windows.Forms.CheckBox GasCucina;
        private System.Windows.Forms.Timer timerThermo;
        private System.Windows.Forms.TrackBar CrepuscolareSalone;
        private System.Windows.Forms.CheckBox PortaCasaAperta;
        private System.Windows.Forms.Timer timerLCD;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Button bInviaTempBagno;
        private System.Windows.Forms.Button bInviaTempCamera2;
        private System.Windows.Forms.Button bInviaTempSalone;
        private System.Windows.Forms.Button bInviaTempCucina;
        private System.Windows.Forms.Button bActivate;
        private System.Windows.Forms.Button bInviaFake;
        private System.Windows.Forms.Button bInviaUnknown;
    }
}

