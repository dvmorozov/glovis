using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Amazon.DynamoDB;
using Amazon.DynamoDB.Model;
using Amazon.Runtime;
using Amazon.SecurityToken;

namespace VideoRequester.Providers
{
    abstract class DynamoDBProvider
    {
        protected AmazonDynamoDBClient client;
        protected String tableName;

        private void CreateClient()
        {
            var userCredentials = new AmazonSecurityTokenServiceConfig();
            //EnvironmentAWSCredentials();
            var stsClient = new AmazonSecurityTokenServiceClient(userCredentials);
            var sessionCredentials = new RefreshingSessionAWSCredentials(stsClient);
            client = new AmazonDynamoDBClient(sessionCredentials);
        }

        protected abstract void putItem();
        protected abstract void getItem();
        protected abstract void updateItem();
        protected abstract void deleteItem();

        public DynamoDBProvider()
        {
            CreateClient();
        }
    }
}
