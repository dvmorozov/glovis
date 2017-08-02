using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB.Model;

namespace VideoRequester.Providers
{
    class DeviceBufferProvider : DynamoDBProvider
    {
        public int ID = 0;
        public int dataItemCount = 0;

        protected override void putItem()
        {
            var request = new PutItemRequest
            {
                TableName = tableName,
                Item = new Dictionary<string, AttributeValue>()
                {
                    { "ID", new AttributeValue { N = ID.ToString() }},
                    { "DataItemCount", new AttributeValue { N = dataItemCount.ToString() }}
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
                    HashKeyElement = new AttributeValue { N = ID.ToString() }
                },
                // Optional parameters.
                AttributesToGet = new List<string>() { "ID", "DataItemCount" },
                ConsistentRead = true
            };
            var response = client.GetItem(request);
            // Check the response.
            var result = response.GetItemResult;
            Dictionary<String, AttributeValue> attributeMap = result.Item;
            ID = int.Parse(attributeMap["ID"].N);
            dataItemCount = int.Parse(attributeMap["DataItemCount"].N);
        }
        protected override void updateItem() { }
        protected override void deleteItem()
        {
            var request = new DeleteItemRequest().WithTableName(tableName).WithKey(
                new Key().WithHashKeyElement(new AttributeValue().WithN(ID.ToString())));

            DeleteItemResponse r = client.DeleteItem(request);
        }

        public DeviceBufferProvider()
        {
            tableName = "DeviceBuffer";
        }
    }
}
