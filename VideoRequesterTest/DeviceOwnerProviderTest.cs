using VideoRequester.Providers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace VideoRequesterTest
{
    
    
    /// <summary>
    ///This is a test class for DeviceOwnerProviderTest and is intended
    ///to contain all DeviceOwnerProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class DeviceOwnerProviderTest
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
        ///A test for DeviceOwnerProvider Constructor
        ///</summary>
        [TestMethod()]
        public void DeviceOwnerProviderConstructorTest()
        {
            DeviceOwnerProvider target = new DeviceOwnerProvider();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for deleteItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void deleteItemTest()
        {
            DeviceOwnerProvider_Accessor target = new DeviceOwnerProvider_Accessor(); // TODO: Initialize to an appropriate value
            target.deleteItem();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for getFirstDeviceID
        ///</summary>
        [TestMethod()]
        public void getFirstDeviceIDTest()
        {
            DeviceOwnerProvider target = new DeviceOwnerProvider(); // TODO: Initialize to an appropriate value
            string dataOwnerID = string.Empty; // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.getFirstDeviceID(dataOwnerID);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void getItemTest()
        {
            DeviceOwnerProvider_Accessor target = new DeviceOwnerProvider_Accessor(); // TODO: Initialize to an appropriate value
            target.getItem();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for putItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void putItemTest()
        {
            DeviceOwnerProvider_Accessor target = new DeviceOwnerProvider_Accessor(); // TODO: Initialize to an appropriate value
            target.putItem();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for updateItem
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VideoRequester.exe")]
        public void updateItemTest()
        {
            DeviceOwnerProvider_Accessor target = new DeviceOwnerProvider_Accessor(); // TODO: Initialize to an appropriate value
            target.updateItem();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }
    }
}
