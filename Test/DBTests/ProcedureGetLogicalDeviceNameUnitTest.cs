using System;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.Data.Schema.UnitTesting;
using Microsoft.Data.Schema.UnitTesting.Conditions;

namespace TownBreathTest.DBTests
{
    [TestClass()]
    public class ProcedureGetLogicalDeviceNameUnitTest : DatabaseTestClass
    {

        public ProcedureGetLogicalDeviceNameUnitTest()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        [TestMethod()]
        public void DBTestScript_GetLogicalDeviceName()
        {
            DatabaseTestActions testActions = this.DBTestScript_GetLogicalDeviceNameData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_GetLogicalDeviceName_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureGetLogicalDeviceNameUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition rowCountCondition1;
            this.DBTestScript_GetLogicalDeviceNameData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_GetLogicalDeviceName_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            rowCountCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            // 
            // DBTestScript_GetLogicalDeviceNameData
            // 
            this.DBTestScript_GetLogicalDeviceNameData.PosttestAction = null;
            this.DBTestScript_GetLogicalDeviceNameData.PretestAction = null;
            this.DBTestScript_GetLogicalDeviceNameData.TestAction = DBTestScript_GetLogicalDeviceName_TestAction;
            // 
            // DBTestScript_GetLogicalDeviceName_TestAction
            // 
            DBTestScript_GetLogicalDeviceName_TestAction.Conditions.Add(rowCountCondition1);
            resources.ApplyResources(DBTestScript_GetLogicalDeviceName_TestAction, "DBTestScript_GetLogicalDeviceName_TestAction");
            // 
            // rowCountCondition1
            // 
            rowCountCondition1.Enabled = true;
            rowCountCondition1.Name = "rowCountCondition1";
            rowCountCondition1.ResultSet = 1;
            rowCountCondition1.RowCount = 1;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        private DatabaseTestActions DBTestScript_GetLogicalDeviceNameData;
    }
}
