using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeDirectory
{
    public partial class _Default : Page
    {
        private readonly SqlConnection connection =
            new SqlConnection(
                "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EmployeeDatabase;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_OnClick(object sender, EventArgs e)
        {
            try
            {

                connection.Open();
                var command = new SqlCommand("addEmployee", connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                if (validation() == false)
                {
                    command.Parameters.AddWithValue("@EmployeeLastName", LastNameBox.Text);
                    command.Parameters.AddWithValue("@EmployeeFirstName", FirstNameBox.Text);
                    command.Parameters.AddWithValue("@EmployeeBDay", DateofBirthBox.Value);
                    command.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("Default.aspx");
                }



            }
            finally
            {

            }

        }

        public bool validation()
        {
            bool validate = false;
            bool checkFName = (FirstNameBox.Text).Any(char.IsDigit);
            bool checkLName = (LastNameBox.Text).Any(char.IsDigit);
            if (checkFName)
            {
                firstNameErr.InnerText = "No integer accepted";
                validate = checkFName;
            }
            if (checkLName)
            {
                lastNameErr.InnerText = "No integer accepted";
                validate = checkLName;
            }
            return validate;
        }
    }
}
