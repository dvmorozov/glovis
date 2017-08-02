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
    public class ProcedureAddChartUnitTest : DatabaseTestClass
    {

        public ProcedureAddChartUnitTest()
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
        public void DBTestScript_AddChart()
        {
            DatabaseTestActions testActions = this.DBTestScript_AddChartData;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_AddChart_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureAddChartUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition1;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition rowCountCondition1;
            this.DBTestScript_AddChartData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_AddChart_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            scalarValueCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            rowCountCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            // 
            // DBTestScript_AddChart_TestAction
            // 
            DBTestScript_AddChart_TestAction.Conditions.Add(scalarValueCondition1);
            DBTestScript_AddChart_TestAction.Conditions.Add(rowCountCondition1);
            resources.ApplyResources(DBTestScript_AddChart_TestAction, "DBTestScript_AddChart_TestAction");
            // 
            // scalarValueCondition1
            // 
            scalarValueCondition1.ColumnNumber = 1;
            scalarValueCondition1.Enabled = true;
            scalarValueCondition1.ExpectedValue = "1";
            scalarValueCondition1.Name = "scalarValueCondition1";
            scalarValueCondition1.NullExpected = false;
            scalarValueCondition1.ResultSet = 2;
            scalarValueCondition1.RowNumber = 1;
            // 
            // DBTestScript_AddChartData
            // 
            this.DBTestScript_AddChartData.PosttestAction = null;
            this.DBTestScript_AddChartData.PretestAction = null;
            this.DBTestScript_AddChartData.TestAction = DBTestScript_AddChart_TestAction;
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

        private DatabaseTestActions DBTestScript_AddChartData;
    }
}
