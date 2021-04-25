<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="TestTask.TaskList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- DataTables JavaScript -->
    <script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tasks</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Our Task Listing
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
  
                             <table width="100%">
                        <tr>
                            <td align="right" style="height: 86px;">
                                <a href="TaskManage.aspx" class="btn btn-success">Add New Item</a>
                            </td>
                        </tr>
                    </table>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover text-center" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="dlSections" runat="server" DataSourceID="ODSClients">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <td style="vertical-align: middle"><%# Eval("Title") %></td>
                                            <td style="vertical-align: middle"><%#Eval("Date", "{0:dd/M/yyyy}")%></td>
                                            <td style="vertical-align: middle">
                                                <%# Eval("Status").ToString() == "1" ? "<i style='color:green' class='fa fa-check'></i>" : "<i style='color:red' class='fa fa-times-circle'></i>" %>
                                            </td>
                              
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>

                        <asp:ObjectDataSource ID="ODSClients" runat="server" SelectMethod="Load" TypeName="DALLayer.TaskManagement">
                   
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</asp:Content>
