using System;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.Data.Schema.UnitTesting;
using Microsoft.Data.Schema.UnitTesting.Conditions;

namespace TownBreathTest
{
    [TestClass()]
    public class ProcedureDeleteAllObjectAttrFromCollectListUnitTest : DatabaseTestClass
    {

        public ProcedureDeleteAllObjectAttrFromCollectListUnitTest()
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
        public void DBTestScript_DeleteAllObjectAttrFromCollectList()
        {
            DatabaseTestActions testActions = this.DBTestScript_DeleteAllObjectAttrFromCollectListData;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureDeleteAllObjectAttrFromCollectListUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition1;
            this.DBTestScript_DeleteAllObjectAttrFromCollectListData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            scalarValueCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            // 
            // DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction
            // 
            DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction.Conditions.Add(scalarValueCondition1);
            resources.ApplyResources(DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction, "DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction");
            // 
            // scalarValueCondition1
            // 
            scalarValueCondition1.ColumnNumber = 1;
            scalarValueCondition1.Enabled = true;
            scalarValueCondition1.ExpectedValue = "1";
            scalarValueCondition1.Name = "scalarValueCondition1";
            scalarValueCondition1.NullExpected = false;
            scalarValueCondition1.ResultSet = 1;
            scalarValueCondition1.RowNumber = 1;
            // 
            // DBTestScript_DeleteAllObjectAttrFromCollectListData
            // 
            this.DBTestScript_DeleteAllObjectAttrFromCollectListData.PosttestAction = null;
            this.DBTestScript_DeleteAllObjectAttrFromCollectListData.PretestAction = null;
            this.DBTestScript_DeleteAllObjectAttrFromCollectListData.TestAction = DBTestScript_DeleteAllObjectAttrFromCollectList_TestAction;
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

        private DatabaseTestActions DBTestScript_DeleteAllObjectAttrFromCollectListData;
    }
}
