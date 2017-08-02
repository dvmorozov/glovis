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
    public class ProcedureGetProcessLogMessagesUnitTest : DatabaseTestClass
    {

        public ProcedureGetProcessLogMessagesUnitTest()
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
        public void DBTestScript_GetProcessLogMessages()
        {
            DatabaseTestActions testActions = this.DBTestScript_GetProcessLogMessagesData;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_GetProcessLogMessages_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureGetProcessLogMessagesUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition notEmptyResultSetCondition1;
            this.DBTestScript_GetProcessLogMessagesData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_GetProcessLogMessages_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            notEmptyResultSetCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition();
            // 
            // DBTestScript_GetProcessLogMessages_TestAction
            // 
            DBTestScript_GetProcessLogMessages_TestAction.Conditions.Add(notEmptyResultSetCondition1);
            resources.ApplyResources(DBTestScript_GetProcessLogMessages_TestAction, "DBTestScript_GetProcessLogMessages_TestAction");
            // 
            // notEmptyResultSetCondition1
            // 
            notEmptyResultSetCondition1.Enabled = true;
            notEmptyResultSetCondition1.Name = "notEmptyResultSetCondition1";
            notEmptyResultSetCondition1.ResultSet = 1;
            // 
            // DBTestScript_GetProcessLogMessagesData
            // 
            this.DBTestScript_GetProcessLogMessagesData.PosttestAction = null;
            this.DBTestScript_GetProcessLogMessagesData.PretestAction = null;
            this.DBTestScript_GetProcessLogMessagesData.TestAction = DBTestScript_GetProcessLogMessages_TestAction;
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

        private DatabaseTestActions DBTestScript_GetProcessLogMessagesData;
    }
}
