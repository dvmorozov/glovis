using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB.Model;

namespace VideoRequester.Providers
{
    class DataItemSerieProvider : DynamoDBProvider
    {
        public int firstDataItemID = 0;
        public int lastDataItemID = 0;
        public int serieID = 0;         /*range key*/
        public int bufferID = 0;        /*hash key*/
        public string startTime = "";

        protected override void putItem()
        {
            var request = new PutItemRequest
            {
                TableName = tableName,
                Item = new Dictionary<string, AttributeValue>()
                {
                    { "FirstDataItemID", new AttributeValue { N = firstDataItemID.ToString() }},
                    { "LastDataItemID", new AttributeValue { N = lastDataItemID.ToString() }},
                    { "SerieID", new AttributeValue { N = serieID.ToString() }},
                    { "BufferID", new AttributeValue { N = bufferID.ToString() }},
                    { "StartTime", new AttributeValue { S = startTime }}
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
                    RangeKeyElement = new AttributeValue { N = serieID.ToString() }
                },
                // Optional parameters.
                AttributesToGet = new List<string>() { "FirstDataItemID", "LastDataItemID", "SerieID", "BufferID", "StartTime" },
                ConsistentRead = true
            };
            var response = client.GetItem(request);
            // Check the response.
            var result = response.GetItemResult;
            Dictionary<String, AttributeValue> attributeMap = result.Item;
            firstDataItemID = int.Parse(attributeMap["FirstDataItemID"].N);
            lastDataItemID = int.Parse(attributeMap["LastDataItemID"].N);
            serieID = int.Parse(attributeMap["SerieID"].N);
            bufferID = int.Parse(attributeMap["BufferID"].N);
            startTime = attributeMap["StartTime"].S;
        }
        protected override void updateItem() { }
        protected override void deleteItem()
        {
            var request = new DeleteItemRequest().WithTableName(tableName).WithKey(
                new Key().WithHashKeyElement(new AttributeValue().WithN(bufferID.ToString())).
                    WithRangeKeyElement(new AttributeValue().WithN(serieID.ToString())));

            DeleteItemResponse r = client.DeleteItem(request);
        }

        public DataItemSerieProvider()
        {
            tableName = "DataItemSerie";
        }
    }
}
