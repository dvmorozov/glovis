using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB.Model;

namespace VideoRequester.Providers
{
    class DataItemProvider : DynamoDBProvider
    {
        public int ID = 0;          /*range key*/
        public int bufferID = 0;    /*hash key*/
        public string itemData = "";
        public string dataOwnerID = "";

        protected override void putItem()
        {
            var request = new PutItemRequest
            {
                TableName = tableName,
                Item = new Dictionary<string, AttributeValue>()
                {
                    { "ID", new AttributeValue { N = ID.ToString() }},
                    { "BufferID", new AttributeValue { N = bufferID.ToString() }},
                    { "ItemData", new AttributeValue { S = itemData }},
                    { "DataOwnerID", new AttributeValue { S = dataOwnerID }}
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
                    HashKeyElement = new AttributeValue { N = bufferID.ToString() },
                    RangeKeyElement = new AttributeValue { N = ID.ToString() }
                },
                // Optional parameters.
                AttributesToGet = new List<string>() { "ID", "BufferID", "ItemData", "DataOwnerID" },
                ConsistentRead = true
            };
            var response = client.GetItem(request);
            // Check the response.
            var result = response.GetItemResult;
            Dictionary<String, AttributeValue> attributeMap = result.Item;
            ID = int.Parse(attributeMap["ID"].N);
            bufferID = int.Parse(attributeMap["BufferID"].N);
            itemData = attributeMap["ItemData"].S;
            dataOwnerID = attributeMap["DataOwnerID"].S;
        }
        protected override void updateItem() { }
        protected override void deleteItem()
        {
            var request = new DeleteItemRequest().WithTableName(tableName).WithKey(
                new Key().WithHashKeyElement(new AttributeValue().WithN(bufferID.ToString())).
                    WithRangeKeyElement(new AttributeValue().WithN(ID.ToString())));

            DeleteItemResponse r = client.DeleteItem(request);
        }

        public DataItemProvider()
        {
            tableName = "DataItem";
        }
    }
}
