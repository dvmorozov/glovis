using VideoRequester.Logic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using VideoRequester.Providers;
using System.Collections.Generic;

namespace TownBreathTest
{
    
    
    /// <summary>
    ///This is a test class for DeviceOwnerTest and is intended
    ///to contain all DeviceOwnerTest Unit Tests
    ///</summary>
    [TestClass()]
    public class DeviceOwnerTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for getDeviceList
        ///</summary>
        [TestMethod()]
        public void getDeviceListTest()
        {
            string dataOwnerID = Guid.NewGuid().ToString(); 
            DeviceOwner target = new DeviceOwner(dataOwnerID);
            target.addOwner();

            DeviceListItem i = new DeviceListItem();
            i.name = "unit-test";
            target.addDevice(i);

            List<DeviceListItem> actual;
            
            actual = target.getDeviceList();
            Assert.AreEqual(actual.Count, 1);

            int id = target.getFirstDeviceID();
            target.deleteDevice(id);

            actual = target.getDeviceList();
            Assert.AreEqual(actual.Count, 0);

            target.deleteOwner();
        }
    }
}
