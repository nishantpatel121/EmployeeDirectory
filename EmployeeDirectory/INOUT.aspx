<%@ Page Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="INOUT.aspx.cs" Inherits="EmployeeDirectory.INOUT" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin: 40px">
        <section class="col-sm-12 col-md-11">
            <div class="form-horizontal">
                <div class="form-group ">
                    <asp:Label CssClass="col-sm-3 control-label " ID="Label1" runat="server" Text="Employee ID"></asp:Label>
                    <div class="col-sm-6 ">
                        <asp:TextBox CssClass="form-control " placeholder="Employee ID" ID="employeeID" runat="server" required ></asp:TextBox>
                    </div><span id="employeeSpan" class="text-danger" runat="server">*</span></div></div>
          
            <div class="form-horizontal">
                <div class="form-group ">
                    <div class="col-sm-6" style="padding-left: 250px"><asp:DropDownList CssClass="dropdown form-control text" ID="CategoryList" runat="server">
                            <asp:ListItem>Log In</asp:ListItem>
                            <asp:ListItem>Log Out</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 btn-toolbar ">
                <asp:Button class="btn btn-success pull-right Submit" id="Button1" type="submit" Text="Submit"  runat="server" OnClick="Loginout_OnClick"   />
            </div>
             </section>

</div>
        <p></p>
         <asp:TextBox ID="ID" runat="server" Height="24px" placeholder="EmployeeID" Width="140px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <span id="employeeSpan1" class="text-danger" runat="server"> *</span>
            <asp:LinkButton ID="gethrs" runat="server" OnClick="gethrs_Click">Click to get Hours</asp:LinkButton>
       
       
    </asp:Content>