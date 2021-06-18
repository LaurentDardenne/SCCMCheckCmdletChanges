
//NO FUNCTIONAL JUST TO CONTAIN A POWERSHELL KEYWORD 
using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Collections.ObjectModel;
using System.Management;

namespace TestSccm
{
    public partial class Test : Form
    {
        private PowerShell PShell;
        private string SccmServer;
        private string SccmSiteCode;

        public Form_Advr(string FichierRef, PowerShell Psh)
        {
            InitializeComponent();
            PShell = Psh;
        }


        private void FrmCreatePckDeploymentSccm()
        {
            PShell.AddScript("Add-CMDeviceCollectionQueryMembershipRule -CollectionName \"" + SoftwareScanName + "\" -RuleName \"" + SoftwareScanName + "\" -QueryExpression \"" + SoftwareQuery + "\"");
            PShell.Invoke();
            PShell.Commands.Clear();


            PShell.AddScript("Move-CMObject -ObjectId $TLDCol.CollectionID -FolderPath " + SccmSiteCode + ":\\DeviceCollection\\" + "\\" + "Etc");
            PShell.Invoke();
            PShell.Commands.Clear();
            this.Close();
        }
}

