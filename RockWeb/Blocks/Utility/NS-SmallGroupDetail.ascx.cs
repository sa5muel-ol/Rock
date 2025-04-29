using System;
using System.ComponentModel;

using Rock;
using Rock.Model;
using Rock.Web.UI;

namespace Blocks.Utility
{
    [DisplayName("Small Group Detail")]
    [Category("Small Groups")]
    [Description("Displays the details of a small group.")]
    public partial class SmallGroupDetail : RockBlock
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowDetail();
            }
        }

        private void ShowDetail()
        {
            var groupId = PageParameter("GroupId").AsInteger();
            if (groupId == 0)
            {
                nbNotFoundOrArchived.Visible = true;
                pnlDetails.Visible = false;
                return;
            }

            var rockContext = new Rock.Data.RockContext();
            var group = new GroupService(rockContext).Get(groupId);

            if (group == null)
            {
                nbNotFoundOrArchived.Visible = true;
                pnlDetails.Visible = false;
                return;
            }

            hfGroupId.Value = group.Id.ToString();
            lReadOnlyTitle.Text = group.Name;

            tbName.Text = group.Name;
            tbDescription.Text = group.Description;
            nbGroupCapacity.Text = group.GroupCapacity.ToString();

            lDateCreated.Text = group.CreatedDateTime.ToShortDateString();
            lDateModified.Text = group.ModifiedDateTime.ToShortDateString();
        }
    }
}