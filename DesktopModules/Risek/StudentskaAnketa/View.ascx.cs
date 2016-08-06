#region Copyright

// 
// Copyright (c) 2016
// by Risek
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


#endregion

namespace Risek.StudentskaAnketa
{

	public partial class View : PortalModuleBase
	{

		#region Event Handlers

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			//cmdSave.Click += cmdSave_Click;
			//cmdCancel.Click += cmdCancel_Click;
		}

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			
			if (!Page.IsPostBack)
			{
                             //txtField.Text = (string)Settings["field"];
			}
		}
		
		protected void cmdSave_Click(object sender, EventArgs e)
		{
            //ModuleController.Instance.UpdateModuleSetting(ModuleId, "field", txtField.Text);
            //DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
		}


		protected void cmdCancel_Click(object sender, EventArgs e)
		{
		}

		#endregion

        #region MyModule

        protected void Obrada()
        {
            StringBuilder sb = new StringBuilder();
            string s;
            sb.AppendLine("Upisali ste sljedeće podatke:");
            // ime i prezime
            if (tbImeIPrezime.Text != String.Empty)
                sb.AppendLine("Ime i prezime: " + tbImeIPrezime.Text);
            // oib
            if (tbOIB.Text != String.Empty)
                sb.AppendLine("OIB: " + tbOIB.Text);
            // spol
            if (rbSpol.SelectedItem != null)
                sb.AppendLine("Spol: " + rbSpol.SelectedItem.Text);
            // adresa
            if (tbAdresa.Text != String.Empty)
                sb.AppendLine("Adresa: " + tbAdresa.Text.Replace(Environment.NewLine, ", "));
            // godina studija
            if (ddGodina.SelectedItem != null)
                sb.AppendLine("Godina studija: " + ddGodina.SelectedItem.Text);
            // omiljeni hobiji
            s = String.Empty;
            foreach (ListItem li in lbHobiji.Items)
                if (li.Selected) 
                {
                    if (s == String.Empty)
                        s = "Omiljeni hobiji: ";
                    else
                        s += ", ";
                    s += li.Value.ToString();
                }
            if (s != String.Empty)
                sb.AppendLine(s);
            // preferirane boje
            s = String.Empty;
            foreach (ListItem li in cbBoje.Items)
                if (li.Selected) 
                {
                    if (s == String.Empty)
                        s = "Preferirane boje: ";
                    else
                        s += ", ";
                    s += li.Text;
                }
            if (s != String.Empty)
                sb.AppendLine(s);
            // vraćamo napomenu
            tbNapomena.Text = sb.ToString();
        }

                protected void lbHobiji_SelectedIndexChanged(object sender, EventArgs e)
        {
            Obrada();
        }

        protected void tbImeIPrezime_TextChanged(object sender, EventArgs e)
        {
            Obrada();
        }

        protected void rbSpol_SelectedIndexChanged(object sender, EventArgs e)
        {
            Obrada();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Obrada();
            if (Page.IsValid)
                Response.Redirect("Potvrda.ascx");
        }

        // server-side validacija oib-a
        protected void vlOIB_ServerValidate(object source, ServerValidateEventArgs args) 
        {
            args.IsValid = oib.CheckOIB(args.Value);
        }


        #endregion

    public class oib
    {
        public static bool CheckOIB(string oib) 
        {
            if (oib.Length != 11) return false;
            long b;
            if (!long.TryParse(oib, out b)) return false;
            int a = 10;
            for (int i = 0; i < 10; i++) 
            {
                a = a + Convert.ToInt32(oib.Substring(i, 1));
                a = a % 10;
                if (a == 0) a = 10;
                a *= 2;
                a = a % 11;
            }
            int kontrolni = 11 - a;
            if (kontrolni == 10) kontrolni = 0;
            return kontrolni == Convert.ToInt32(oib.Substring(10, 1));
        }
    }

	}
}

