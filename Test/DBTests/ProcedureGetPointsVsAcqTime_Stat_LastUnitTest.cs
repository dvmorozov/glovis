﻿using System;
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
    public class ProcedureGetPointsVsAcqTime_Stat_LastUnitTest : DatabaseTestClass
    {

        public ProcedureGetPointsVsAcqTime_Stat_LastUnitTest()
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
        public void DBTestScript_GetPointsVsAcqTime_Stat_Last()
        {
            DatabaseTestActions testActions = this.DBTestScript_GetPointsVsAcqTime_Stat_LastData;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProcedureGetPointsVsAcqTime_Stat_LastUnitTest));
            Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition notEmptyResultSetCondition1;
            this.DBTestScript_GetPointsVsAcqTime_Stat_LastData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            notEmptyResultSetCondition1 = new Microsoft.Data.Schema.UnitTesting.Conditions.NotEmptyResultSetCondition();
            // 
            // DBTestScript_GetPointsVsAcqTime_Stat_LastData
            // 
            this.DBTestScript_GetPointsVsAcqTime_Stat_LastData.PosttestAction = null;
            this.DBTestScript_GetPointsVsAcqTime_Stat_LastData.PretestAction = null;
            this.DBTestScript_GetPointsVsAcqTime_Stat_LastData.TestAction = DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction;
            // 
            // DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction
            // 
            DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction.Conditions.Add(notEmptyResultSetCondition1);
            resources.ApplyResources(DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction, "DBTestScript_GetPointsVsAcqTime_Stat_Last_TestAction");
            // 
            // notEmptyResultSetCondition1
            // 
            notEmptyResultSetCondition1.Enabled = true;
            notEmptyResultSetCondition1.Name = "notEmptyResultSetCondition1";
            notEmptyResultSetCondition1.ResultSet = 1;
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

        private DatabaseTestActions DBTestScript_GetPointsVsAcqTime_Stat_LastData;
    }
}