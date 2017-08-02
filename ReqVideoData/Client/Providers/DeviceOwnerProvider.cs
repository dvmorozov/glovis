using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB.Model;

namespace VideoRequester.Providers
{
    class OwnerListItem
    { 
        public int firstDeviceID = 0;
        public int lastDeviceID = 0;
    }

    class DeviceOwnerProvider : DynamoDBProvider
    {
        protected string dataOwnerID = "";    /*hash key*/
        protected int firstDeviceID = 0;
        protected int lastDeviceID = 0;

        protected override void putItem()
        {
            var request = new PutItemRequest
            {
                TableName = tableName,
                Item = new Dictionary<string, AttributeValue>()
                {
                    { "DataOwnerID", new AttributeValue { S = dataOwnerID }},
                    { "FirstDeviceID", new AttributeValue { N = firstDeviceID.ToString() }},
                    { "LastDeviceID", new AttributeValue { N = lastDeviceID.ToString() }}
                }
            };
            client.PutItem(request);
        }

        protected override void getItem()
        {
            var request = new GetItemRequest
            {
                TableName = tableName,
                Key = new Key
                {
                    HashKeyElement = new AttributeValue { S = dataOwnerID.ToString() }
                },
                // Optional parameters.
                AttributesToGet = new List<string>() { "DataOwnerID", "FirstDeviceID", "LastDeviceID" },
                ConsistentRead = true
            };
            var response = client.GetItem(request);
            // Check the response.
            var result = response.GetItemResult;
            Dictionary<String, AttributeValue> attributeMap = result.Item;
            firstDeviceID = int.Parse(attributeMap["FirstDeviceID"].N);
            lastDeviceID = int.Parse(attributeMap["LastDeviceID"].N);
            dataOwnerID = attributeMap["DataOwnerID"].S;
        }

        protected override void updateItem() {
            putItem();
        }

        protected override void deleteItem()
        {
            var request = new DeleteItemRequest().WithTableName(tableName).WithKey(
                new Key().WithHashKeyElement(new AttributeValue().WithS(dataOwnerID)));

            DeleteItemResponse r = client.DeleteItem(request);
        }

        public void addOwner(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
            this.firstDeviceID = 0;
            this.lastDeviceID = 0;
            putItem();
        }

        public void deleteOwner(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
            deleteItem();
        }

        public void updateOwner(string dataOwnerID, OwnerListItem i)
        {
            this.firstDeviceID = i.firstDeviceID;
            this.lastDeviceID = i.lastDeviceID;
            this.dataOwnerID = dataOwnerID;
            updateItem();
        }

        public int getFirstDeviceID(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
            getItem();
            return firstDeviceID;
        }

        public int getLastDeviceID(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
            getItem();
            return lastDeviceID;
        }

        public OwnerListItem getOwner(string dataOwnerID)
        {
            this.dataOwnerID = dataOwnerID;
            getItem();
            OwnerListItem i = new OwnerListItem();
            i.firstDeviceID = firstDeviceID;
            i.lastDeviceID = lastDeviceID;
            return i;
        }

        public DeviceOwnerProvider()
        {
            tableName = "DeviceOwner";
        }
    }
}
