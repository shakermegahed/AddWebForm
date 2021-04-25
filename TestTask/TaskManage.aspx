<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="TaskManage.aspx.cs" Inherits="TestTask.TaskManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Add Task</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Fill Task Data
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="alert alert-success" id="alertSuccess" runat="server" visible="false">
                            Done, changes has been saved successfully!
                        </div>
                        <div class="alert alert-danger" id="alertFaild" runat="server" visible="false">
                            Error, Please try again later!
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Title</label>
                            <div class="col-sm-4">
                                <input class="form-control" id="txtTitle" runat="server" type="text" />
                            </div>
                        </div>
                        <hr />
                                <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Date</label>
                            <div class="col-sm-4">
                              <input class="form-control" id="txtDate" runat="server" type="date" />
                            </div>
                        </div>
                                <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Status</label>
                            <div class="col-sm-4">
                                 <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" >
                                 <asp:ListItem Text="Completed" Value="1"></asp:ListItem>       
                                 <asp:ListItem Text="Not Completed" Value="2"></asp:ListItem>       
                                 </asp:DropDownList>
                            </div>
                        </div>

                                           <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Date</label>
                            <div class="col-sm-6">
                                  <textarea id="edContent" style="width: 50%" rows="5" cols="80" runat="server">
                                        </textarea>
                            </div>
                        </div>
      
                

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-4">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save"></asp:Button>
                              <button type="submit" id="btnSaveNew" class="btn btn-warning" onserverclick="btnSaveNew_ServerClick" runat="server">Add New Item</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
