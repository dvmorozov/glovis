using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB.Model;

namespace VideoRequester.Providers
{
    class DeviceListItem
    {
        public string name;
    }

    enum DeletedDevicePosition
    { 
        last,
        first,
        middle
    }

    class DeviceProvider : DynamoDBProvider
    {
        protected string dataOwnerID = "Data owner ID";    /*hash key*/
        protected int ID = 0;                              /*range key*/
        protected int prevID = 0;
        protected int nextID = 0;
        protected int bufferID = 0;
        protected string name = "Device name";

        protected override void putItem() {
            var request = new PutItemRequest
            {
                TableName = tableName,
                Item = new Dictionary<string, AttributeValue>()
                {
                    { "DataOwnerID", new AttributeValue { S = dataOwnerID }},
                    { "ID", new AttributeValue { N = ID.ToString() }},
                    { "NextID", new AttributeValue { N = nextID.ToString() }},
                    { "PrevID", new AttributeValue { N = prevID.ToString() }},
                    { "BufferID", new AttributeValue { N = bufferID.ToString() }},
                    { "Name", new AttributeValue { S = name }}
                }
            };
            client.PutItem(request);
        }
        protected override void getItem() {
            var request = new GetItemRequest
            {
                TableName = tableName,
                Key = new Key
                {
                    RangeKeyElement = new AttributeValue { N = ID.ToString() },
                    HashKeyElement = new AttributeValue { S = dataOwnerID }
                },
                // Optional parameters.
                AttributesToGet = new List<string>() { "ID", "NextID", "PrevID", "BufferID", "Name" },
                ConsistentRead = true
            };
            var response = client.GetItem(request);
            // Check the response.
            var result = response.GetItemResult;
            Dictionary<String, AttributeValue> attributeMap = result.Item;
            ID = int.Parse(attributeMap["ID"].N);
            name = attributeMap["Name"].S;
            nextID = int.Parse(attributeMap["NextID"].N);
            prevID = int.Parse(attributeMap["PrevID"].N);
            bufferID = int.Parse(attributeMap["BufferID"].N);
        }

        protected override void updateItem() {
            putItem();
        }

        protected override void deleteItem() {
            var request = new DeleteItemRequest().WithTableName(tableName).WithKey(
                new Key().WithHashKeyElement(new AttributeValue().WithS(dataOwnerID)).
                    WithRangeKeyElement(new AttributeValue().WithN(ID.ToString())));

            DeleteItemResponse r = client.DeleteItem(request);
        }

        public int addDevice(string dataOwnerID, int lastDeviceID, DeviceListItem item) {
            this.dataOwnerID = dataOwnerID;
            this.ID = lastDeviceID;
            if (lastDeviceID != 0)
            {   // there exist other items
                getItem();
                this.nextID = lastDeviceID + 1;
                putItem();
            }
            this.prevID = lastDeviceID;
            this.ID = lastDeviceID + 1;
            this.nextID = 0;
            this.name = item.name;
            putItem();
            return this.ID;
        }

        public DeletedDevicePosition deleteDevice(string dataOwnerID, int ID)
        {
            this.ID = ID;
            this.dataOwnerID = dataOwnerID;
            getItem();
            int savedPrevID = prevID;
            deleteItem();

            DeletedDevicePosition r = DeletedDevicePosition.middle;
            int savedID = 0;
            if (nextID != 0)
            {
                this.ID = nextID;
                getItem();
                prevID = savedPrevID;
                savedID = this.ID;
                putItem();
            }
            else r = DeletedDevicePosition.last;
            if (savedPrevID != 0)
            {
                this.ID = savedPrevID;
                getItem();
                nextID = savedID;
                putItem();
            }
            else r = DeletedDevicePosition.first;
            return r;
        }

        public List<DeviceListItem> getDeviceList(string dataOwnerID, int firstDeviceID /*id of first device in the chain*/)
        {
            List<DeviceListItem> r = new List<DeviceListItem>();
            this.dataOwnerID = dataOwnerID;
            this.ID = firstDeviceID;
            getItem();
            DeviceListItem i = new DeviceListItem();
            i.name = name;
            r.Add(i);
            while (nextID != 0)
            {
                i = new DeviceListItem();
                i.name = name;
                r.Add(i);
                this.ID = nextID;
                getItem();
            }
            return r;
        }

        public int getNextDevice(string dataOwnerID, int deviceID) 
        {
            this.dataOwnerID = dataOwnerID;
            this.ID = deviceID;
            getItem();
            return nextID;
        }

        public int getPrevDevice(string dataOwnerID, int deviceID) 
        {
            this.dataOwnerID = dataOwnerID;
            this.ID = deviceID;
            getItem();
            return prevID;
        }

        public int getCount()
        {
            //List<DeviceListItem> l = getDeviceList(dataOwnerID, firstDeviceID);
            //return l.Count;
            return 0;
        }

        public DeviceProvider()
        {
            tableName = "Device";
        }
    }
}
