using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.IO;
using System.Globalization;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntelligentHome
{
    public partial class FormMain : Form
    {
        static HttpClient client = new HttpClient();
        WebServer ws;
        bool bActive = false;
        bool bHeatUnitCamera1 = false;
        bool bHeatUnitCamera2 = false;
        bool bHeatUnitSalone = false;
        bool bHeatUnitCucina = false;
        bool bHeatUnitBagno = false;

        public FormMain()
        {
            InitializeComponent();

            client.BaseAddress = new Uri("http://localhost:8085/rest/api/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("text/plain"));

            ws = new WebServer(SendResponse, "http://localhost:8086/home/");
            ws.Run();
        }

        public string SendResponse(HttpListenerRequest request)
        {
            if(request.HasEntityBody)
            {
                Stream body = request.InputStream;
                Encoding encoding = request.ContentEncoding;
                StreamReader reader = new System.IO.StreamReader(body, encoding);
                string command = reader.ReadToEnd();
                reader.Close();
                body.Close();
                
                // Processa i comandi
                rtbLog.Invoke((Action)delegate
                {
                    rtbLog.AppendText("Ricevuto comando: " + command + "\n");
                });
                rtbLog.Invoke((Action)delegate
                {
                    rtbLog.ScrollToCaret();
                });

                string[] cmd = command.Split(':');
                if(cmd.Length!=2)
                {
                    LCD.Text = "Comando [" + command + "] non gestibile!";
                    return "KO";
                } 


                if (cmd[0].Equals("LCD"))
                {
                    Invoke((Action)delegate
                    {
                        LCD.Text = cmd[1];
                    });
                    return "OK";
                }

                if(cmd[0].Equals("HeatUnitCamera1"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        HeatUnitCamera1.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
                        bHeatUnitCamera1 = true;
                    }
                    else
                    {
                        HeatUnitCamera1.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOff);
                        bHeatUnitCamera1 = false;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("HeatUnitCamera2"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        HeatUnitCamera2.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
                        bHeatUnitCamera2 = true;
                    }
                    else
                    {
                        HeatUnitCamera2.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOff);
                        bHeatUnitCamera2 = false;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("HeatUnitBagno"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        HeatUnitBagno.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
                        bHeatUnitBagno = true;
                    }
                    else
                    {
                        HeatUnitBagno.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOff);
                        bHeatUnitBagno = false;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("HeatUnitSalone"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        HeatUnitSalone.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
                        bHeatUnitSalone = true;
                    }
                    else
                    {
                        HeatUnitSalone.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOff);
                        bHeatUnitSalone = false;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("HeatUnitCucina"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        HeatUnitCucina.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
                        bHeatUnitCucina = true;
                    }
                    else
                    {
                        HeatUnitCucina.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOff);
                        bHeatUnitCucina = false;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("FinestraCucina"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        FinestraCucina.Image = new Bitmap(IntelligentHome.Properties.Resources.DoorOn);
                    }
                    else
                    {
                        FinestraCucina.Image = new Bitmap(IntelligentHome.Properties.Resources.DoorOff);                     
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("LuceSalone"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        gbLuceSalone.BackColor = Color.LightYellow;
                    }
                    else
                    {
                        gbLuceSalone.BackColor = SystemColors.Control;
                    }
                    return "OK"; 
                }

                if (cmd[0].Equals("PortaCasa"))
                {
                    if (cmd[1].Equals("true"))
                    {
                        PortaCasaAperta.Checked = true;
                        Invoke((Action)delegate
                        {
                            PortaCasaAperta.Invalidate();
                            PortaCasaAperta.Update();
                        });                        
                    }
                    else
                    {
                        PortaCasaAperta.Checked = false;
                        Invoke((Action)delegate
                        {
                            PortaCasaAperta.Invalidate();
                            PortaCasaAperta.Update();
                        });
                    }
                    return "OK"; 
                }

                LCD.Text = "Attuatore [" + cmd[1] + "] sconosciuto!";
                return "KO";
            }

            return "OK";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            HeatUnitBagno.Image = new Bitmap(IntelligentHome.Properties.Resources.FlameOn);
        }

        private async void button2_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempCamera1", value = TempCamera1.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode+"\n");
            rtbLog.ScrollToCaret();
        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            ws.Stop();
        }

        private void timerCamera1_Tick(object sender, EventArgs e)
        {
            if (bHeatUnitCamera1)
            {
                decimal v = TempCamera1.Value;
                v = v + (decimal)0.1;
                TempCamera1.Value = v;
                Invoke((Action)delegate
                {
                    bInviaTempCamera1.PerformClick();
                });
            }
            if(bHeatUnitCamera2)
            {
                decimal v = TempCamera2.Value;
                v = v + (decimal)0.1;
                TempCamera2.Value = v;
                Invoke((Action)delegate
                {
                    bInviaTempCamera2.PerformClick();                
                });
            }
            if (bHeatUnitBagno)
            {
                decimal v = TempBagno.Value;
                v = v + (decimal)0.1;
                TempBagno.Value = v;
                Invoke((Action)delegate
                {
                    bInviaTempBagno.PerformClick();
                });
            }
            if (bHeatUnitCucina)
            {
                decimal v = TempCucina.Value;
                v = v + (decimal)0.1;
                TempCucina.Value = v;
                Invoke((Action)delegate
                {
                    bInviaTempCucina.PerformClick();
                });
            }
            if (bHeatUnitSalone)
            {
                decimal v = TempSalone.Value;
                v = v + (decimal)0.1;
                TempSalone.Value = v;
                Invoke((Action)delegate
                {
                    bInviaTempSalone.PerformClick();
                });
            }
        }

        private async void cbGasCucina_CheckedChanged(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "GasCucina", value = GasCucina.Checked.ToString().ToLower() };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void tbCrepuscolareSalone_ValueChanged(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "CrepuscolareSalone", value = CrepuscolareSalone.Value.ToString() };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void cbEsci_CheckedChanged(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "PosizioneBob", value = "101"};
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void cbPortaCasaAperta_CheckedChanged(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "PortaCasa", value = PortaCasaAperta.Checked.ToString().ToLower() };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private void timerLCD_Tick(object sender, EventArgs e)
        {
            if (bActive)
            {
                LCD.Text = "IntelligentHome...benvenuto!";
                timerLCD.Stop();
            }
        }

        private async void nTermostatoCamera1_ValueChanged(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TermostatoCamera1", value = TermostatoCamera1.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Control[] cs = this.Controls.Find("TermostatoCamera1", true);
            foreach(Control c in cs) {
                rtbLog.AppendText(c.Name);
            }
        }

        private async void bInviaTempBagno_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempBagno", value = TempBagno.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void bInviaTempCamera2_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempCamera2", value = TempCamera2.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void bInviaTempCucina_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempCucina", value = TempCucina.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void bInviaTempSalone_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempSalone", value = TempSalone.Value.ToString("F1", CultureInfo.InvariantCulture) };
            rtbLog.AppendText("Invio " + sensor + "...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void bActivate_Click(object sender, EventArgs e)
        {
            bActivate.Enabled = false;
            try
            {
                var sensor = new Sensor() { name = "TermostatoCamera1", value = TermostatoCamera1.Value.ToString("F1", CultureInfo.InvariantCulture) };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                var response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                sensor = new Sensor() { name = "TermostatoCamera2", value = TermostatoCamera2.Value.ToString("F1", CultureInfo.InvariantCulture) };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                sensor = new Sensor() { name = "TermostatoBagno", value = TermostatoBagno.Value.ToString("F1", CultureInfo.InvariantCulture) };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                sensor = new Sensor() { name = "TermostatoCucina", value = TermostatoCucina.Value.ToString("F1", CultureInfo.InvariantCulture) };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                sensor = new Sensor() { name = "TermostatoSalone", value = TermostatoSalone.Value.ToString("F1", CultureInfo.InvariantCulture) };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                sensor = new Sensor() { name = "CrepuscolareSalone", value = CrepuscolareSalone.Value.ToString() };
                rtbLog.AppendText("Invio " + sensor + "...\n");
                response = await client.PostAsJsonAsync("sensor", sensor);
                response = await client.PostAsJsonAsync("sensor", sensor);
                rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
                rtbLog.ScrollToCaret();

                cbGasCucina_CheckedChanged(null, null);

                cbPortaCasaAperta_CheckedChanged(null, null);

                LCD.Text = "IntelligentHome...benvenuto!";
                bActive = true;              
            }
            catch (HttpRequestException)
            {
                rtbLog.AppendText("Non posso connettermi.");
                bActivate.Enabled = true;
            }
        }

        private async void bInviaFake_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "TempCamera1", value = "sporco" };
            rtbLog.AppendText("Invio dati sporchi...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
        }

        private async void bInviaUnknown_Click(object sender, EventArgs e)
        {
            var sensor = new Sensor() { name = "Finestra1", value = "sporco" };
            rtbLog.AppendText("Invio dati sporchi...\n");
            var response = await client.PostAsJsonAsync("sensor", sensor);
            rtbLog.AppendText("Inviato sensore " + sensor + " - Response:" + response.StatusCode + "\n");
            rtbLog.ScrollToCaret();
            if(response.StatusCode==HttpStatusCode.Unauthorized)
            {
                LCD.Text = "Sensore [" + sensor.name + "] non autorizzato.";
            }
        }
    }
}
