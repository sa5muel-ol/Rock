<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NS-SmallGroupDetail.ascx.cs" Inherits="Blocks.Utility.SmallGroupDetail" %>

<%-- <script type="text/javascript"> --%>
<%--     function clearActiveDialog() { --%>
<%--         $('#<%=hfActiveDialog.ClientID %>').val(''); --%>
<%--     } --%>
<%-- --%>
<%--     Sys.Application.add_load(function () { --%>
<%--         $('.js-follow-status').tooltip(); --%>
<%--     }); --%>
<%-- </script> --%>

<asp:UpdatePanel ID="upnlGroupDetail" runat="server">
    <ContentTemplate>
        <Rock:NotificationBox ID="nbNotFoundOrArchived" runat="server" NotificationBoxType="Warning" Visible="false" Text="That group does not exist or it has been archived." />

        <asp:Panel ID="pnlDetails" CssClass="js-group-panel" runat="server">
            <asp:HiddenField ID="hfGroupId" runat="server" />

            <div class="panel panel-block">
                <div class="panel-heading">
                    <h1 class="panel-title">
                        <asp:Literal ID="lGroupIconHtml" runat="server" />
                        <asp:Literal ID="lReadOnlyTitle" runat="server" />
                    </h1>
                </div>

                <div class="panel-body">
                    <Rock:NotificationBox ID="nbEditModeMessage" runat="server" NotificationBoxType="Info" />
                    <asp:ValidationSummary ID="vsGroup" runat="server" HeaderText="Please correct the following:" CssClass="alert alert-validation" />
                    <asp:CustomValidator ID="cvGroup" runat="server" Display="None" />

                    <div id="pnlEditDetails" runat="server">
                        <div class="row">
                            <div class="col-md-6">
                                <Rock:DataTextBox ID="tbName" runat="server" SourceTypeName="Rock.Model.Group, Rock" PropertyName="Name" Label="Name" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <Rock:DataTextBox ID="tbDescription" runat="server" SourceTypeName="Rock.Model.Group, Rock" PropertyName="Description" TextMode="MultiLine" Rows="4" Label="Description" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <Rock:RockLiteral ID="lDateCreated" runat="server" Label="Date Created" />
                            </div>
                            <div class="col-md-6">
                                <Rock:RockLiteral ID="lDateModified" runat="server" Label="Date Modified" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <Rock:NumberBox ID="nbGroupCapacity" runat="server" Label="Group Capacity" NumberType="Integer" MinimumValue="0" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>