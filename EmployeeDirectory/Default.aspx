<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeDirectory._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row">
    <section class="col-sm-12 col-md-11">
    <div class="form-horizontal">
        <div class="form-group ">
            <asp:Label CssClass="col-sm-3 control-label " ID="FirstName" runat="server" Text="First Name"></asp:Label>
            <div class="col-sm-6 ">
                <asp:TextBox CssClass="form-control " placeholder="First Name" ID="FirstNameBox" runat="server" required ></asp:TextBox>
            </div><span id="firstNameErr" class="text-danger" runat="server">*</span></div></div>
        <div class="form-horizontal">
            <div class="form-group ">
                <asp:Label CssClass="col-sm-3 control-label " ID="LastName" runat="server" Text="Last Name"></asp:Label>
                <div class="col-sm-6 ">
                    <asp:TextBox CssClass="form-control" placeholder="Last Name" ID="LastNameBox" runat="server" required ></asp:TextBox>
                </div><span id="lastNameErr" runat="server" class="text-danger">*</span></div></div>
     <div class="form-horizontal">
        <div class="form-group ">
            <asp:Label CssClass="col-sm-3 control-label " ID="DateofBirth" runat="server" Text="Date of Birth"></asp:Label>
            <div class="col-sm-6 ">
                <input class="form-control" ID="DateofBirthBox" min="1950-01-01" max="2019-01-20" placeholder="mm/dd/yyyy" required runat="server" type="date" />
            </div><span id="DateOfBirthErr" runat="server" class="text-danger">*</span></div></div>
        <div class="col-sm-9 btn-toolbar ">
           <asp:Button class="btn btn-success pull-right Submit" id="Submit" type="submit" Text="Submit"  runat="server" OnClick="Submit_OnClick"   />
        </div></section></div>
  
    
    
    
    <asp:SqlDataSource ID="SqlDataEmployee" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EmployeeDatabase %>" DeleteCommand="DELETE FROM [EmployeeMaster] WHERE [EmployeeID] = @original_EmployeeID AND [EmployeeLastName] = @original_EmployeeLastName AND [EmployeeFirstName] = @original_EmployeeFirstName AND (([EmployeeBDay] = @original_EmployeeBDay) OR ([EmployeeBDay] IS NULL AND @original_EmployeeBDay IS NULL))" InsertCommand="INSERT INTO [EmployeeMaster] ([EmployeeLastName], [EmployeeFirstName], [EmployeeBDay]) VALUES (@EmployeeLastName, @EmployeeFirstName, @EmployeeBDay)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [EmployeeMaster]" UpdateCommand="UPDATE [EmployeeMaster] SET [EmployeeLastName] = @EmployeeLastName, [EmployeeFirstName] = @EmployeeFirstName, [EmployeeBDay] = @EmployeeBDay WHERE [EmployeeID] = @original_EmployeeID AND [EmployeeLastName] = @original_EmployeeLastName AND [EmployeeFirstName] = @original_EmployeeFirstName AND (([EmployeeBDay] = @original_EmployeeBDay) OR ([EmployeeBDay] IS NULL AND @original_EmployeeBDay IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeLastName" Type="String" />
            <asp:Parameter Name="original_EmployeeFirstName" Type="String" />
            <asp:Parameter Name="original_EmployeeBDay" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeLastName" Type="String" />
            <asp:Parameter Name="EmployeeFirstName" Type="String" />
            <asp:Parameter Name="EmployeeBDay" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeLastName" Type="String" />
            <asp:Parameter Name="EmployeeFirstName" Type="String" />
            <asp:Parameter Name="EmployeeBDay" Type="String" />
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeLastName" Type="String" />
            <asp:Parameter Name="original_EmployeeFirstName" Type="String" />
            <asp:Parameter Name="original_EmployeeBDay" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataEmployee">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField  DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
            <asp:BoundField DataField="EmployeeLastName" HeaderText="EmployeeLastName" SortExpression="EmployeeLastName" />
            <asp:BoundField DataField="EmployeeFirstName" HeaderText="EmployeeFirstName" SortExpression="EmployeeFirstName" />
            <asp:BoundField DataField="EmployeeBDay" HeaderText="EmployeeBDay" SortExpression="EmployeeBDay" />
        </Columns>
    </asp:GridView>
</asp:Content>
