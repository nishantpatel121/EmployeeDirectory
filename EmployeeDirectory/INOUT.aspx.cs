using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeDirectory
{
    public partial class INOUT : System.Web.UI.Page
    {
        private readonly SqlConnection connection =
            new SqlConnection(
                "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EmployeeDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Loginout_OnClick(object sender, EventArgs e)
        {
            try
            {

                if (validation())
                {
                    connection.Open();
                    var command = new SqlCommand("inout", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    DateTime date = DateTime.Now;
                    command.Parameters.AddWithValue("@DTREmployeeID", employeeID.Text);
                    command.Parameters.AddWithValue("@DTRDateTime", date.ToString("MM/dd/yy HH:mm:ss"));
                    command.Parameters.AddWithValue("@DTRType", CategoryList.Text);
                    command.ExecuteNonQuery();
                    connection.Close();

                    Response.Redirect("INOUT.aspx");
                }

            }
            finally
            {

            }

        }

        public bool validation()
        {
            bool vali = false;


            var intout = 0;
            if (Int32.TryParse(employeeID.Text, out intout))
            {
                connection.Open();
                var query = "Select * from EmployeeMaster ORDER BY EmployeeID DESC";
                var command = new SqlCommand(query, connection);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    foreach (var e in reader)
                    {

                        if (reader["EmployeeID"].ToString() == employeeID.Text)
                        {
                            vali = true;
                            break;
                        }
                        else
                        {
                            employeeSpan.InnerText = "Can not find him/her in database";
                        }
                    }
                }
                else
                {
                    employeeSpan.InnerText = "Lol database is empty";
                }
            }
            else
            {
                employeeSpan.InnerText = "Please enter valid employee number";
            }




            connection.Close();
            return vali;
        }

        protected void gethrs_Click(object sender, EventArgs e)
        {
            
            
            var intout = 0;

            if (Int32.TryParse(ID.Text, out intout))
            {
                
                connection.Open();
                var query = "Select * from DTRMaster where DTREmployeeID =" + intout;
                var command = new SqlCommand(query, connection);
                var reader = command.ExecuteReader();

                DateTime hrs = new DateTime();
                DateTime totalhrs = new DateTime();
                string[] login = new string[50];
                string[] logout = new string[50];
                
                if (reader.HasRows)
                {
                    var counter1 = 0;
                    var counter2 = 0;
                    while (reader.Read())
                    {
                       
                        if (reader["DTRType"].ToString()=="Log In")
                        {
                            login[counter1] = reader["DTRDateTime"].ToString();
                            counter1++;
                        }
                        else
                        {
                            logout[counter2] = reader["DTRDateTime"].ToString();
                            counter2++;
                        }                      
                        
                    }

                    for (int i = 0; i <logout.Length; i++)
                    {
                        if (logout[i]!=null&& login[i]!=null)
                        {
                            DateTime logoutDate = DateTime.ParseExact(logout[i], "MM/dd/yy HH:mm:ss", null);
                            DateTime loginDate = DateTime.ParseExact(login[i], "MM/dd/yy HH:mm:ss", null);
                            totalhrs += logoutDate - loginDate;
                        }
                        
                    }
                    employeeSpan1.InnerText = (totalhrs-hrs).ToString();
                }
                else
                {
                    employeeSpan1.InnerText = "Lol database is empty";
                }
            }
            else
            {
                employeeSpan1.InnerText = "Please enter valid employee number";
            }
        }
    }
}