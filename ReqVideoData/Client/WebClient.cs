/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Windows.Forms;
using System.Net.Sockets;
using System.Threading;
using System.Text;
using System.IO;
using System.Collections.Generic;
using Amazon.DynamoDB;
using Amazon.DynamoDB.Model;
using Amazon.Runtime;
using Amazon.SecurityToken;
using System.Web;
using System.Web.Helpers;

namespace VideoRequester
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
    public class Form1 : System.Windows.Forms.Form
    {
        DoImages doImages;
        static int m_Count;
        static int maxReplyMs = 0;
        static int meanReplyMs = 0;
        static int replyMsSum = 0;
        static int maxReadMs = 0;

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox txtServer;
        private System.Windows.Forms.Button btnPress;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMessage;
        private System.Windows.Forms.TextBox txtPort;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.TextBox txtFrames;
        private System.ComponentModel.IContainer components;

        private static string tableName = "Snapshot";
        private Button btnDelete;
        private Label label4;
        private TextBox txtMax;
        private Label label5;
        private TextBox txtMean;
        private static AmazonDynamoDBClient client;

        private static void CreateClient()
        {
            var userCredentials = new AmazonSecurityTokenServiceConfig();
            //EnvironmentAWSCredentials();
            var stsClient = new AmazonSecurityTokenServiceClient(userCredentials);
            var sessionCredentials = new RefreshingSessionAWSCredentials(stsClient);
            client = new AmazonDynamoDBClient(sessionCredentials);
        }

        public Form1()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();
            //??? без этого вывод сообщения вызывает исключение
            // см. http://rucoders.ru/t2874.htm#comments
            // http://rucoders.ru/page/56
            CheckForIllegalCrossThreadCalls = false;
            CreateClient();
        }

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose( bool disposing )
        {
            if( disposing )
            {
                if (components != null) 
                {
                    components.Dispose();
                }
            }

            if (doImages != null)
            {
                doImages.Done = true;
                doImages = null;
            }
            base.Dispose( disposing );
        }

		#region Windows Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnPress = new System.Windows.Forms.Button();
            this.txtServer = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMessage = new System.Windows.Forms.TextBox();
            this.txtPort = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtFrames = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.btnDelete = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtMax = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtMean = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(320, 240);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // btnPress
            // 
            this.btnPress.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPress.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnPress.Location = new System.Drawing.Point(232, 328);
            this.btnPress.Name = "btnPress";
            this.btnPress.Size = new System.Drawing.Size(80, 32);
            this.btnPress.TabIndex = 1;
            this.btnPress.Tag = "1";
            this.btnPress.Text = "Start";
            this.btnPress.Click += new System.EventHandler(this.btnPress_Click);
            // 
            // txtServer
            // 
            this.txtServer.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtServer.Location = new System.Drawing.Point(16, 288);
            this.txtServer.Name = "txtServer";
            this.txtServer.Size = new System.Drawing.Size(96, 20);
            this.txtServer.TabIndex = 3;
            this.txtServer.Text = "92.54.114.133"; //"192.168.0.1";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(16, 245);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(120, 40);
            this.label1.TabIndex = 4;
            this.label1.Text = "Enter server name or ip address";
            // 
            // txtMessage
            // 
            this.txtMessage.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtMessage.Location = new System.Drawing.Point(8, 376);
            this.txtMessage.Name = "txtMessage";
            this.txtMessage.ReadOnly = true;
            this.txtMessage.Size = new System.Drawing.Size(304, 20);
            this.txtMessage.TabIndex = 5;
            // 
            // txtPort
            // 
            this.txtPort.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtPort.Location = new System.Drawing.Point(19, 335);
            this.txtPort.Name = "txtPort";
            this.txtPort.Size = new System.Drawing.Size(48, 20);
            this.txtPort.TabIndex = 6;
            this.txtPort.Text = "399";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.Location = new System.Drawing.Point(16, 311);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 23);
            this.label2.TabIndex = 7;
            this.label2.Text = "Port Number";
            // 
            // txtFrames
            // 
            this.txtFrames.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtFrames.Location = new System.Drawing.Point(118, 288);
            this.txtFrames.Name = "txtFrames";
            this.txtFrames.ReadOnly = true;
            this.txtFrames.Size = new System.Drawing.Size(48, 20);
            this.txtFrames.TabIndex = 8;
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.Location = new System.Drawing.Point(118, 264);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 16);
            this.label3.TabIndex = 9;
            this.label3.Text = "Frames";
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDelete.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnDelete.Location = new System.Drawing.Point(146, 327);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(80, 32);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.Tag = "1";
            this.btnDelete.Text = "Delete";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label4.Location = new System.Drawing.Point(172, 264);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 16);
            this.label4.TabIndex = 12;
            this.label4.Text = "Max";
            // 
            // txtMax
            // 
            this.txtMax.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtMax.Location = new System.Drawing.Point(172, 288);
            this.txtMax.Name = "txtMax";
            this.txtMax.ReadOnly = true;
            this.txtMax.Size = new System.Drawing.Size(50, 20);
            this.txtMax.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label5.Location = new System.Drawing.Point(229, 264);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(37, 16);
            this.label5.TabIndex = 14;
            this.label5.Text = "Mean";
            // 
            // txtMean
            // 
            this.txtMean.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtMean.Location = new System.Drawing.Point(228, 288);
            this.txtMean.Name = "txtMean";
            this.txtMean.ReadOnly = true;
            this.txtMean.Size = new System.Drawing.Size(50, 20);
            this.txtMean.TabIndex = 13;
            // 
            // Form1
            // 
            this.AcceptButton = this.btnPress;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.CancelButton = this.btnPress;
            this.ClientSize = new System.Drawing.Size(320, 402);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtMean);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtMax);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtFrames);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtPort);
            this.Controls.Add(this.txtMessage);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtServer);
            this.Controls.Add(this.btnPress);
            this.Controls.Add(this.pictureBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "WebClient";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
		#endregion

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main() 
        {
            Thread.CurrentThread.Name = "Main";
            Application.Run(new Form1());
        }

        private void btnPress_Click(object sender, System.EventArgs e)
        {
            // If the button says 'Start'
            if ((string)btnPress.Tag == "1")
            {
                // Create a new thread to receive the images
                try
                {
                    m_Count = 0;
                    timer1.Enabled = true;
                    txtMessage.Text = "";
                    doImages = new DoImages(this, Convert.ToInt32(txtPort.Text));
                    ThreadStart o = new ThreadStart(doImages.ThreadProc);
                    Thread thread = new Thread( o );
                    thread.Name="Imaging";
                    thread.Start();
                }
                catch (Exception ex)
                {
                    txtMessage.Text = ex.Message;
                    return;
                }

                // Reset the button tag and description
                btnPress.Tag = "2";
                btnPress.Text = "Stop";
            }
            else
            {
                Stop();
                timer1.Enabled = false;
                txtFrames.Text = m_Count.ToString();
            }
        }

        private void Stop()
        {
            // Inform the thread it should stop
            doImages.Done = true;
            doImages = null;

            // Reset the button tag and description
            btnPress.Tag = "1";
            btnPress.Text = "Start";
        }

        private void timer1_Tick(object sender, System.EventArgs e)
        {
            txtFrames.Text = m_Count.ToString();
            txtMax.Text = //maxReadMs.ToString(); 
                maxReplyMs.ToString();
            txtMean.Text = meanReplyMs.ToString();
        }

        // ================================================================================================
        public class DoImages
        {
            // Abort indicator
            public bool Done;

            // Form to write to
            private Form1 m_f;

            // Client connection to server
            private TcpClient tcpClient;

            // stream to read from
            private NetworkStream networkStream;

            public DoImages(Form1 f, int nPort)
            {
                Done = false;
                m_f = f;

                // Connect to the server and get the stream
                tcpClient = new TcpClient(m_f.txtServer.Text, nPort);
                tcpClient.NoDelay = false;
                tcpClient.ReceiveTimeout = 5000;
                tcpClient.ReceiveBufferSize = 20000;
                networkStream = tcpClient.GetStream();
            }

            public void ThreadProc()
            {
                string s;
                int iBytesComing, iBytesRead, iOffset;
                byte [] byLength = new byte[10];
                byte [] byImage = new byte[1000];
                MemoryStream m = new MemoryStream(byImage);

                do
                {
                    try
                    {
                        // Read the fixed length string that
                        // tells the image size
                        //DateTime beforeRead = DateTime.Now;
                        iBytesRead = networkStream.Read(byLength, 0, 10);
                        //DateTime afterRead = DateTime.Now;
                        //TimeSpan readWait = afterRead.Subtract(beforeRead);
                        int readMs = 0;// readWait.Hours * 3600 * 1000 + readWait.Minutes * 60000 + readWait.Seconds * 1000 + readWait.Milliseconds;
                        if (readMs > maxReadMs) maxReadMs = readMs;

                        if (iBytesRead != 10)
                        {
                            m_f.txtMessage.Text = "No response from host";
                            m_f.Stop();
                            break;
                        }
                        s = Encoding.ASCII.GetString(byLength);
                        iBytesComing = Convert.ToInt32(s);

                        // Make sure our buffer is big enough
                        if (iBytesComing > byImage.Length)
                        {
                            byImage = new byte[iBytesComing];
                            m = new MemoryStream(byImage);
                            tcpClient.ReceiveBufferSize=iBytesComing + 10;
                        }
                        else
                        {
                            m.Position = 0;
                        }

                        // Read the image
                        iOffset = 0;

                        do
                        {
                            iBytesRead = networkStream.Read(byImage, iOffset, iBytesComing - iOffset);
                            if (iBytesRead != 0)
                            {
                                iOffset += iBytesRead;
                            }
                            else
                            {
                                m_f.txtMessage.Text = "No response from host";
                                m_f.Stop();
                                break;
                            }
                        } while ((iOffset != iBytesComing) && (!Done));


                        if (!Done)
                        {
                            // Write back a byte
                            networkStream.Write(byImage, 0, 1);
                            // Encode image data
                            String sIn = "";
                            m.Seek(0, System.IO.SeekOrigin.Begin);
                            for (int i = 0; i < iBytesComing; i++)
                            {
                                Int32 b = m.ReadByte();
                                sIn += b.ToString("X2");
                            }

                            int sInLen = sIn.Length;

                            DateTime begin = DateTime.Now;
                            var request = new PutItemRequest
                            {
                                TableName = tableName,
                                Item = new Dictionary<string, AttributeValue>()
                                    {
                                    { "SerieID", new AttributeValue { S = "1" }},
                                    { "SnapshotSeqNum", new AttributeValue { N = "1" /*(m_Count + 1).ToString()*/ }},
                                    // short string up to 60 bytes
                                    { "Snapshot", new AttributeValue { S = sIn.Substring(0, 60) }}
                                    }
                            };
                            client.PutItem(request);

                            var r1 = new GetItemRequest
                            {
                                TableName = tableName,
                                Key = new Key
                                {
                                    RangeKeyElement = new AttributeValue { N = /*(m_Count + 1).ToString()*/"1" },
                                    HashKeyElement = new AttributeValue { S = "1" }
                                },
                                // Optional parameters.
                                AttributesToGet = new List<string>() { "Snapshot", "SnapshotSeqNum" },
                                ConsistentRead = true
                            };
                            var response = client.GetItem(r1);
                            DateTime end = DateTime.Now;
                            TimeSpan delta = end.Subtract(begin);
                            int replyMs = delta.Hours * 3600 * 1000 + delta.Minutes * 60000 + delta.Seconds * 1000 + delta.Milliseconds;
                            if (replyMs > maxReplyMs) maxReplyMs = replyMs;
                            replyMsSum += replyMs;
                            // Check the response.
                            var result = response.GetItemResult;
                            Dictionary<String, AttributeValue> attributeMap = result.Item;
                            AttributeValue a = attributeMap["Snapshot"];
                            // put original frame on the screen
                            //String pic = a.S;
                            String pic = sIn;
                            
                            Byte[] imgData = new Byte[pic.Length / 2];
                            Int32 byteIndex = 0;
                            for (int i = 0 ; i < pic.Length; i += 2)
                            {
                                String hex = pic.Substring(i, 2);
                                Byte b = Byte.Parse(hex, System.Globalization.NumberStyles.AllowHexSpecifier);
                                imgData[byteIndex++] = b;
                            }

                            // Put the image on the screen
                            MemoryStream m1 = new MemoryStream(imgData);
                            m1.SetLength(byteIndex);
                            if (null != m_f.pictureBox1.Image) m_f.pictureBox1.Image.Dispose();
                            m_f.pictureBox1.Image = new System.Drawing.Bitmap(m1);
                            m1.Dispose();

                            // Increment the frame count
                            m_Count++;
                            meanReplyMs = replyMsSum / m_Count;
                        }
                        //Thread.Yield();
                        //Thread.Sleep(100);
                        //GC.Collect();
                    }
                    catch(Exception e)
                    {
                        // If we get out of sync, we're probably toast, since
                        // there is currently no resync mechanism
                        m_f.txtMessage.Text = e.Message;
                        m_f.Stop();
                    }

                } while (!Done);

                networkStream.Close();
                tcpClient.Close();
                networkStream = null;
                tcpClient = null;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            var request = new DeleteItemRequest().WithTableName("Snapshot").WithKey(new Key().WithHashKeyElement(new AttributeValue().WithS("1")).
                WithRangeKeyElement(new AttributeValue().WithN("1")));
               
            DeleteItemResponse r = client.DeleteItem(request);
        }
	}
}
