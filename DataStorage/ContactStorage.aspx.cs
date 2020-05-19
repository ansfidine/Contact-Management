using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataStorage
{
    public partial class ContactStorage : System.Web.UI.Page
    {
        //SQL Connection String PATH
        SqlConnection sqlcon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security = True");
       
        protected void Page_Load(object sender, EventArgs e)
        {    
            FillGridView();
            

            if (IsPostBack)
            {
                 btnDelete.Enabled = false;
                 
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Clear();
        }
        public void Clear()
        {
            hfContactID.Value = "";
            txtName.Text = txtMobile.Text = txtAddress.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(sqlcon.State==System.Data.ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("ContactCreateOrUpdate",sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ContactID",(hfContactID.Value==""?0:Convert.ToInt32(hfContactID.Value)));
            sqlCmd.Parameters.AddWithValue("@Name",txtName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Mobile",txtMobile.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Address",txtAddress.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            string contactID = hfContactID.Value;
            Clear();

            if (hfContactID.Value == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();
        }
        
        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ContactViewAll",sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            gvContact.DataSource = dtbl;
            gvContact.DataBind();
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int ContactID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ContactViewByID", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ContactID", ContactID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            hfContactID.Value = ContactID.ToString();
            txtName.Text = dtbl.Rows[0]["Name"].ToString();
            txtMobile.Text = dtbl.Rows[0]["Mobile"].ToString();
            txtAddress.Text = dtbl.Rows[0]["Address"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlCmd = new SqlCommand("ContactDeleteByID",sqlcon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ContactID",Convert.ToInt32(hfContactID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlcon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Delete Successfully";
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}