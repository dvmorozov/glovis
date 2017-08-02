using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Xml;
using web.Models;

namespace web.Controllers
{
    //  The controller implements methods for rendering snapshot series.
    public class RenderSnapshotController : BaseChartController
    {
        protected ISnapshotSerieRepository SnapshotSerieRepository;

        public RenderSnapshotController()
        {
            SetRepository(new SnapshotSerieRepository(), new BaseChartRepository(), Entities);
        }

        private void SetRepository(ISnapshotSerieRepository r2, IBaseChartRepository b, GlovisMasterBaseEntities e)
        {
            BaseChartRepository = b;
            BaseChartRepository.SetEntities(e);
            SnapshotSerieRepository = r2;
            SnapshotSerieRepository.SetEntities(e);
        }

        protected ViewChart FillChartData(Int64 id /*chart id.*/, int width, int height)
        {
            var viewchart = BaseChartRepository.GetChart(id, GetUserId());
            ViewBag.Width = (width != -1) ? width : viewchart.Width;
            ViewBag.Height = (height != -1) ? height : viewchart.Height;

            var fileNames = new List<String>();
            var statFileNames = new List<String>();

            var l = BaseChartRepository.GetPointsVsAcqTime_Stat_Last(id, GetUserId(), 1/*only one last snapshot can be shown*/);

            if (l != null)
            {
                for (var i = 0; i < l.Count(); i++)
                {
                    var vf = l[i];
                    switch (vf.Content.ToLower())
                    {
                        case "dataset":
                            fileNames.Add(vf.FileName);
                            break;
                        case "datastat":
                            statFileNames.Add(vf.FileName);
                            break;
                    }
                }
            }
            ViewBag.FileNames = fileNames;
            ViewBag.StatFileNames = statFileNames;

            return viewchart;
        }

        //  Shows a single snapshot from the serie.
        public ActionResult RenderSnapshotUnauthorized(Int64 id /*chart id.*/, Int32 width, Int32 height)
        {
            try
            {
                var v = FillChartData(id, width, height);

                var fileNames = (List<String>) ViewBag.FileNames;

                Trace.Assert(v.ChartType.TrimEnd().ToLower() == "snapshot");
                Trace.Assert((fileNames != null) && (fileNames.Count() != 0));

                var dataSet = new DataSet();
                dataSet.ReadXmlSchema(Server.MapPath("~/App_Data/data.xsd"));

                var elementName = "";

                var xml = fileNames[0]; //  Only single data element can be shown as snapshot, so get first file.
                var reader = new XmlTextReader(new MemoryStream(Encoding.ASCII.GetBytes(xml)));

                var culture = new CultureInfo("en-US");
                var time = "";

                try
                {
                    //  reading the file
                    while (reader.Read())
                    {
                        switch (reader.NodeType)
                        {
                            case XmlNodeType.Element: //  The node is an element.
                                elementName = reader.Name.ToLower();
                                break;
                            case XmlNodeType.Text: //  Display the text in each element.
                                switch (elementName)
                                {
                                    case ("stringvalue"):
                                        //  converting into binary data
                                        string pic = reader.Value;
                                        var imgData = new Byte[pic.Length/2];
                                        int byteIndex = 0;
                                        for (int i = 0; i < pic.Length; i += 2)
                                        {
                                            string hex = pic.Substring(i, 2);
                                            byte b = Byte.Parse(hex, NumberStyles.AllowHexSpecifier);
                                            imgData[byteIndex++] = b;
                                        }
                                        //  output the snapshot (image)
                                        var image = new WebImage(imgData);
                                        image.Resize((int) ViewBag.Width, (int) ViewBag.Height, false);
                                        image.AddTextWatermark(time, "Red");

                                        return new FileContentResult(image.GetBytes("image/png"), "image/png");

                                    case ("time"):
                                        time = reader.Value;
                                        double d = Double.Parse(time, culture.NumberFormat);
                                        DateTime dt = DateTime.FromOADate(d);
                                        dt = dt.AddDays(2);
                                            //  to fix difference in time base between SQL CONVERT and FromOADate
                                        time = dt.ToString(CultureInfo.InvariantCulture);
                                        break;
                                }
                                break;
                        }
                    }
                    throw new Exception("Invalid XML-data content");
                }
                finally
                {
                    // this allows file deleting in the case of reading failure
                    reader.Close();
                }
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //  the procedure extracts snapshot data from database
        //private ViewChart FillSnapshotData(Int64 id /*chart id.*/, int width, int height, string serieId,
        //                                   Int64 snapshotId, FillSnapshotMode mode)
        //{
        //    var userId = GetUserID();
        //    var viewchart = BaseChartRepository.GetChart(id, userId);
        //    ViewBag.Width = (width != -1) ? width : viewchart.Width;
        //    ViewBag.Height = (height != -1) ? height : viewchart.Height;

        //    var fileNames = new List<String>();
        //    var statFileNames = new List<String>(); // empty list only for compatibility with rendering method (View)
        //    List<ViewFile> l = null;

        //    switch (mode)
        //    {
        //        case (FillSnapshotMode.First):
        //            l = SnapshotSerieRepository.GetFirstSnapshotAsXML(serieId, userId);
        //            break;
        //        case (FillSnapshotMode.Last):
        //            l = SnapshotSerieRepository.GetLastSnapshotAsXML(serieId, userId);
        //            break;
        //        case (FillSnapshotMode.Next):
        //            l = SnapshotSerieRepository.GetNextSnapshotAsXML(serieId, snapshotId, userId);
        //            break;
        //        case (FillSnapshotMode.Prev):
        //            l = SnapshotSerieRepository.GetPrevSnapshotAsXML(serieId, snapshotId, userId);
        //            break;
        //    }

        //    if (l != null)
        //    {
        //        for (var i = 0; i < l.Count(); i++)
        //        {
        //            var vf = l[i];
        //            if (vf.Content.ToLower() == "dataset")
        //            {
        //                fileNames.Add(vf.FileName);
        //            }
        //        }
        //    }
        //    ViewBag.FileNames = fileNames;
        //    ViewBag.StatFileNames = statFileNames;

        //    return viewchart;
        //}

        //  this method is used from chart set updating JScript
        public ActionResult RenderSnapshot(Int64 id /*chart id.*/, Int32 width, Int32 height)
        {
            return RenderSnapshotUnauthorized(id, width, height);
        }

        public ActionResult ShowChart(Int64 id /*chart id.*/)
        {
            try
            {
                var userId = GetUserId();
                var viewchart = BaseChartRepository.GetChart(id, userId);
                ViewBag.ChartID = viewchart.ID;
                ViewBag.Width = viewchart.Width;
                ViewBag.Height = viewchart.Height;
                //  fills serie set
                ViewBag.SerieList = BaseChartRepository.GetSerieList(id, userId);
                return View("ShowChart", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult ShowSerie(Int64 id /*chart id.*/, string serieId)
        {
            try
            {
                var userId = GetUserId();
                var viewchart = BaseChartRepository.GetChart(id, userId);
                ViewBag.ChartID = viewchart.ID;
                ViewBag.Width = viewchart.Width;
                ViewBag.Height = viewchart.Height;
                ViewBag.SerieID = serieId;

                return View("ShowChart", viewchart);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //private enum FillSnapshotMode
        //{
        //    First,
        //    Last,
        //    Prev,
        //    Next
        //}
    }
}