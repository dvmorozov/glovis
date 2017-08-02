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
    public class ProcedureExportXMLTemplateUnitTest : DatabaseTestClass
    {

        public ProcedureExportXMLTemplateUnitTest()
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
        public void DBTestScript_ExportXMLTemplate()
        {
            DatabaseTestActions testActions = this.DBTestScript_ExportXMLTemplateData;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_ExportXMLTemplate_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureExportXMLTemplateUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition notEmptyResultSetCondition1;
            this.DBTestScript_ExportXMLTemplateData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_ExportXMLTemplate_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            notEmptyResultSetCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition();
            // 
            // DBTestScript_ExportXMLTemplate_TestAction
            // 
            DBTestScript_ExportXMLTemplate_TestAction.Conditions.Add(notEmptyResultSetCondition1);
            resources.ApplyResources(DBTestScript_ExportXMLTemplate_TestAction, "DBTestScript_ExportXMLTemplate_TestAction");
            // 
            // notEmptyResultSetCondition1
            // 
            notEmptyResultSetCondition1.Enabled = true;
            notEmptyResultSetCondition1.Name = "notEmptyResultSetCondition1";
            notEmptyResultSetCondition1.ResultSet = 1;
            // 
            // DBTestScript_ExportXMLTemplateData
            // 
            this.DBTestScript_ExportXMLTemplateData.PosttestAction = null;
            this.DBTestScript_ExportXMLTemplateData.PretestAction = null;
            this.DBTestScript_ExportXMLTemplateData.TestAction = DBTestScript_ExportXMLTemplate_TestAction;
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

        private DatabaseTestActions DBTestScript_ExportXMLTemplateData;
    }
}
