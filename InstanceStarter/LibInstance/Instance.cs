using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Amazon;
using Amazon.EC2;
using Amazon.EC2.Model;

namespace LibInstance
{
    public abstract class BaseInstance
    {
        private readonly string _imageId;
        private readonly string _instanceType;
        private readonly string _keyName;
        private readonly string _securityGroup;
        private readonly int _instancePort;

        public string ImageId 
        {
            get { return _imageId; }
        }

        public string InstanceType
        {
            get { return _instanceType; }
        }

        public string KeyName
        {
            get { return _keyName; }
        }

        public string SecurityGroup
        {
            get { return _securityGroup; }
        }

        public int InstancePort
        {
            get { return _instancePort; }
        }

        /// <summary>
        /// Initializes object fields.
        /// </summary>
        /// <param name="imageId"></param>
        /// <param name="instanceType"></param>
        /// <param name="keyName"></param>
        /// <param name="securityGroup"></param>
        /// <param name="instancePort">Is not returned by EC2. Instead is read from the configuration file.</param>
        protected BaseInstance(string imageId, string instanceType, string keyName, string securityGroup, int instancePort)
        {
            _imageId = imageId;
            _instanceType = instanceType;
            _keyName = keyName;
            _securityGroup = securityGroup;
            _instancePort = instancePort;
        }

        public class InstanceDescriptor
        {
            private readonly string _id;
            private readonly string _domain;

            public InstanceDescriptor(string id, string domain)
            {
                _id = id;
                _domain = domain;
            }

            public string Id
            {
                get { return _id; }
            }

            public string Domain
            {
                get { return _domain; }
            }
        }

        public abstract void StartInstance(out List<string> instanceIds, int maxCount = 1);
        public abstract void StartInstance(out string id);
        public abstract void StopInstance(string ip);
        public abstract void TerminateInstance(List<string> instanceIds);
        public abstract void GetRunningInstances(List<string> instanceIds,
                                                 out List<InstanceDescriptor> runningInstanceIds);
        public abstract bool IsInstanceRunning(string instanceId);
        public abstract string GetInstanceDomain(string instanceId);
    }

    public class TestInstance : BaseInstance
    {
        private List<string> _runningInstances;
        private const string InstanceName = "ami-test";

        public TestInstance(string imageId, string instanceType, string keyName, string securityGroup, int instancePort) : 
            base(imageId, instanceType, keyName, securityGroup, instancePort)
        {
        }

        public override void StartInstance(out List<string> instanceIds, int maxCount = 1)
        {
            _runningInstances = new List<string> { InstanceName };
            instanceIds = _runningInstances;
        }

        public override void StartInstance(out string id)
        {
            _runningInstances = new List<string> { InstanceName };
            id = _runningInstances.First();
        }

        public override void StopInstance(string ip)
        {
            _runningInstances = null;
        }

        public override void TerminateInstance(List<string> instanceIds)
        {
            _runningInstances = null;
        }

        public override void GetRunningInstances(List<string> instanceIds,
                                                 out List<InstanceDescriptor> runningInstanceIds)
        {
            runningInstanceIds = _runningInstances.Select(i => new InstanceDescriptor(i, "localhost")).ToList();
        }

        public override bool IsInstanceRunning(string instanceId)
        {
            return instanceId == InstanceName;
        }

        public override string GetInstanceDomain(string instanceId)
        {
            return "localhost";
        }
    }

    public class Ec2Instance : BaseInstance
    {
        public Ec2Instance(string imageId, string instanceType, string keyName, string securityGroup, int instancePort) : 
            base(imageId, instanceType, keyName, securityGroup, instancePort)
        {
        }

        /// <summary>
        /// Starts a few instances of AMI given in the constructor.
        /// </summary>
        /// <param name="instanceIds">Resulting list of started instances (should have a single item).</param>
        /// <param name="maxCount">The number of instances to start.</param>
        public override void StartInstance(out List<string> instanceIds, int maxCount = 1)
        {
            //  Creates client.
            using (var ec2Client = new AmazonEC2Client(RegionEndpoint.USEast1))
            {
                //  Associates security group.
                var secGroupRequest = new DescribeSecurityGroupsRequest();
                secGroupRequest.GroupNames.Add(SecurityGroup);

                //var secGroupResponse = ec2Client.DescribeSecurityGroups(secGroupRequest);
                //var secGroup = secGroupResponse.DescribeSecurityGroupsResult.SecurityGroup[0];

                //  Starts instance.
                var runInstanceRequest = new RunInstancesRequest
                    {
                        ImageId = ImageId,
                        InstanceType = InstanceType,
                        MinCount = 1,
                        MaxCount = maxCount,
                        KeyName = KeyName //  Key pair name.
                    };
                runInstanceRequest.SecurityGroups.Add(SecurityGroup);

                var runResponse = ec2Client.RunInstances(runInstanceRequest);
                
                instanceIds = new List<string>();
                var instances = runResponse.Reservation.Instances;

                /*
                var startInstanceRequest = new StartInstancesRequest()
                    {
                        InstanceId = new List<string> { "i-98237ce5" }
                    };

                var runResponse = ec2Client.StartInstances(startInstanceRequest);
                var instances = runResponse.StartInstancesResult.StartingInstances;
                */
                //  If the list is empty it obviously means that the instance was not started.
                //  Hense, throws an exception.
                if (instances.Count == 0)
                    throw new Exception("The instance was not started.");

                //  Returns ids of started instances.
#if DEBUG
                foreach (var item in instances)
                {
                    instanceIds.Add(item.InstanceId);
                    Console.WriteLine("Instance Id: {0}", item.InstanceId);
                }
#else
                instanceIds.AddRange(instances.Select(item => item.InstanceId));
#endif
            }
        }

        /// <summary>
        /// Starts single instance (simplified version of the method).
        /// </summary>
        /// <param name="id">Instance identifier.</param>
        public override void StartInstance(out string id)
        {
            List<string> instanceIds;
            StartInstance(out instanceIds);
            
            Debug.Assert(instanceIds.Count == 1);
            
            id = instanceIds.First();
        }

        public override void StopInstance(string ip)
        {
        }

        public override void TerminateInstance(List<string> instanceIds)
        {
            //  Creates client.
            using (var ec2Client = new AmazonEC2Client(RegionEndpoint.USEast1))
            {
                //  Terminates the instances.
                //  This code terminates the instances and deletes associated AMIs!
                var termRequest = new TerminateInstancesRequest {InstanceIds = instanceIds};
#if DEBUG
                var termResponse = 
#endif
                    ec2Client.TerminateInstances(termRequest);
#if DEBUG
                var terminatedInstances = termResponse.TerminateInstancesResult.TerminatingInstance;
                foreach (var instance in terminatedInstances)
                {
                    Console.WriteLine("Terminated Instance: " + instance.InstanceId);
                }
#endif
            }
        }

        public override void GetRunningInstances(List<string> instanceIds, out List<InstanceDescriptor> runningInstanceIds)
        {
            //  Creates client.
            using (var ec2Client = new AmazonEC2Client(RegionEndpoint.USEast1))
            {
                runningInstanceIds = new List<InstanceDescriptor>();

                var instancesRequest = new DescribeInstancesRequest { InstanceIds = instanceIds };
                var statusResponse = ec2Client.DescribeInstances(instancesRequest);
                var runningInstances = statusResponse.Reservations[0].Instances;
#if DEBUG
                foreach (var instance in runningInstances)
                {
                    runningInstanceIds.Add(new InstanceDescriptor(instance.InstanceId, instance.PrivateDnsName));

                    Console.WriteLine("Instance Status: " + instance.InstanceState.Name);
                    Console.WriteLine("Instance DNS name: " + instance.PrivateDnsName);
                }
#else
                runningInstanceIds.AddRange(runningInstances.Select(instance => new InstanceDescriptor(instance.InstanceId, instance.PrivateDnsName)));
#endif
            }
        }

        /// <summary>
        /// Returns true if the instance is running and has a domain name.
        /// </summary>
        /// <param name="instanceId">Instance identifier.</param>
        /// <returns>True if the instance exists and has a domain name.</returns>
        public override bool IsInstanceRunning(string instanceId)
        {
            var instanceIds = new List<string> { instanceId };
            List<InstanceDescriptor> runningInstanceIds;
            GetRunningInstances(instanceIds, out runningInstanceIds);
            return runningInstanceIds.First(s => s.Id == instanceId && s.Domain != "") != null;
        }

        /// <summary>
        /// Returns the instance domain name. Throws an exception if the instance does not exist.
        /// </summary>
        /// <param name="instanceId">Instance identifier.</param>
        /// <returns>Instance domain name.</returns>
        public override string GetInstanceDomain(string instanceId)
        {
            var instanceIds = new List<string> { instanceId };
            List<InstanceDescriptor> runningInstanceIds;
            GetRunningInstances(instanceIds, out runningInstanceIds);
            var i = runningInstanceIds.First(s => s.Id == instanceId); 
            //  The i must not be null here. If so, this is an exception.
            return i.Domain;
        }
    }
}
