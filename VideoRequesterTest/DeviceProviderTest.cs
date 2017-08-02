using VideoRequester.Providers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace TownBreathTest
{
    /// <summary>
    ///This is a test class for DeviceProviderTest and is intended
    ///to contain all DeviceProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class DeviceProviderTest
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
        ///A test for DeviceProvider Constructor
        ///</summary>
        [TestMethod()]
        public void DeviceProviderConstructorTest()
        {
            DeviceProvider target = new DeviceProvider();
            //Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for addDevice
        ///</summary>
        [TestMethod()]
        public void addDeviceTest()
        {
            DeviceProvider_Accessor target = new DeviceProvider_Accessor();
            DeviceListItem_Accessor i = new DeviceListItem_Accessor();
            i.name = "new item";
            int lastID = target.addDevice("unit-test", 0, i);
            try
            {
                target = new DeviceProvider_Accessor();
                target.ID = lastID;
                target.dataOwnerID = "unit-test";
                target.getItem();
                Assert.AreEqual(target.name, "new item");
            }
            finally
            {
                target.dataOwnerID = "unit-test";
                target.ID = lastID;
                target.deleteItem();
            }
        }

        /// <summary>
        ///A test for deleteDevice
        ///</summary>
        [TestMethod()]
        public void deleteDeviceTest()
        {
            DeviceProvider_Accessor target = new DeviceProvider_Accessor(); // TODO: Initialize to an appropriate value
            //target.deleteDevice();
            //Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for deleteItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void deleteItemTest()
        {
            DeviceProvider_Accessor target = new DeviceProvider_Accessor(); // TODO: Initialize to an appropriate value
            target.deleteItem();
            //Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for getItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void getItemTest()
        {
            putItemTest();
        }

        /// <summary>
        ///A test for getNextDevice
        ///</summary>
        [TestMethod()]
        public void getNextDeviceTest()
        {
            DeviceProvider target = new DeviceProvider(); // TODO: Initialize to an appropriate value
            //target.getNextDevice();
            //Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for getPrevDevice
        ///</summary>
        [TestMethod()]
        public void getPrevDeviceTest()
        {
            DeviceProvider target = new DeviceProvider(); // TODO: Initialize to an appropriate value
            //target.getPrevDevice();
            //Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for putItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void putItemTest()
        {
            try
            {
                DeviceProvider_Accessor target = new DeviceProvider_Accessor();
                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.nextID = 111;
                target.prevID = 222;
                target.name = "unit-test";
                target.putItem();

                target = new DeviceProvider_Accessor();
                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.getItem();
                Assert.AreEqual(target.nextID, 111);
                Assert.AreEqual(target.prevID, 222);
                Assert.AreEqual(target.name, "unit-test");
            }
            finally 
            {
                DeviceProvider_Accessor target = new DeviceProvider_Accessor();
                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.deleteItem();
            }
        }

        /// <summary>
        ///A test for updateItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void updateItemTest()
        {
            try
            {
                DeviceProvider_Accessor target = new DeviceProvider_Accessor();
                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.nextID = 111;
                target.prevID = 222;
                target.name = "unit-test";
                target.putItem();

                target.nextID = 333;
                target.prevID = 444;
                target.name = "unit-test2";
                target.updateItem();

                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.getItem();
                Assert.AreEqual(target.nextID, 333);
                Assert.AreEqual(target.prevID, 444);
                Assert.AreEqual(target.name, "unit-test2");
            }
            finally
            {
                DeviceProvider_Accessor target = new DeviceProvider_Accessor();
                target.dataOwnerID = "unit-test";
                target.ID = 1;
                target.deleteItem();
            }
        }

        /// <summary>
        ///A test for getDeviceList
        ///</summary>
        [TestMethod()]
        public void getDeviceListTest()
        {
            DeviceProvider target = new DeviceProvider();
            int itemCount = 10;
            string dataOwnerID = "unit-test";
            try
            {
                DeviceListItem item = new DeviceListItem();
                
                for(int i = 0; i < itemCount; i++) {
                    item.name = "unit-test " + i.ToString();
                    target.addDevice(dataOwnerID, i, item);
                }

                List<DeviceListItem> l = target.getDeviceList(dataOwnerID, 1);

                Assert.AreEqual(l.Count, itemCount);
            }
            finally
            {
                for (int i = 0; i < itemCount; i++)
                {
                    target.deleteDevice(dataOwnerID, i + 1);
                }
            }
        }
    }
}
