using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            SqlDataSource3.InsertParameters["FirstName"].DefaultValue = txtFirstName.Text;
            SqlDataSource3.InsertParameters["LastName"].DefaultValue = txtLastName.Text;
            SqlDataSource3.InsertParameters["DepartmentID"].DefaultValue = deptDropDownList.SelectedValue;

            try
            {
                SqlDataSource3.Insert();
                lblResult.Text = txtFirstName.Text + " Created!";
            }
            catch(Exception ex)
            {
                lblResult.Text = "Error" + ex.Message;
            }
        }
    }
}