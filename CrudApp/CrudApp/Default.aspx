
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrudApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Read</h1>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeConnectionString %>" SelectCommand="spReadDepartmentData" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeConnectionString %>" SelectCommand="spReadEmployeeDepartment" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="DepartmentID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DepartmentID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EmployeeFirstName" HeaderText="EmployeeFirstName" SortExpression="EmployeeFirstName" />
                    <asp:BoundField DataField="EmployeeLastName" HeaderText="EmployeeLastName" SortExpression="EmployeeLastName" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                    <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" InsertVisible="False" ReadOnly="True" SortExpression="DepartmentID" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            </div>
        <div>
            <h1>Create</h1>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeConnectionString %>" SelectCommand="spReadDepartmentData" SelectCommandType="StoredProcedure" InsertCommand="spInsertEmployee" InsertCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <span>Select Department</span><asp:DropDownList ID="deptDropDownList" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="DepartmentName" DataValueField="DepartmentID"></asp:DropDownList>
            <br />
            <span>First Name:</span>
            <asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
            <span>Last Name:</span>
            <asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
            <br />
            <asp:Button runat="server" Text="Create" OnClick="Button_Click"/>
            <br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </div>
        <div>
            <h1>Update</h1>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeConnectionString %>" SelectCommand="SELECT EmployeeID, EmployeeFirstName, EmployeeLastName, DepartmentID FROM Employee" UpdateCommand="spUpdateEmployee" UpdateCommandType="StoredProcedure">
                <UpdateParameters>
                    <asp:Parameter Name="EmployeeFirstName" Type="String" />
                    <asp:Parameter Name="EmployeeLastName" Type="String" />
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <h1>Delete!</h1>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource5">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeFirstName" HeaderText="EmployeeFirstName" SortExpression="EmployeeFirstName" />
                    <asp:BoundField DataField="EmployeeLastName" HeaderText="EmployeeLastName" SortExpression="EmployeeLastName" />
                    <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeConnectionString %>" DeleteCommand="spDeleteEmployeeData" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM Employee">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
