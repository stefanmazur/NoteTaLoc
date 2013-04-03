using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoteTaLocTests
{
    [TestClass]
    public class Spike3Tests
    {
        private TestContext testContextInstance;

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

        [TestMethod]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:53447/Spike3.aspx")]
        [AspNetDevelopmentServerHost(@"C:\Users\Stefan Mazur\Documents\Visual Studio 2012\Projects\NoteTaLoc\NoteTaLoc", "/")]
        public void LoadSpike3()
        {
            Page page = testContextInstance.RequestedPage;
            var gridView1 = page.FindControl("GridView1") as GridView;
            Assert.IsTrue(gridView1.Rows.Count > 0, "Aucun point");
        }
    }
}
