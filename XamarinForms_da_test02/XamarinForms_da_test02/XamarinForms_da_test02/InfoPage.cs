using System.Collections.Generic;

namespace XamarinForms_da_test02
{
    public class InfoPage
    {
        public string topWelcomeInfo;
        public string downWelcomeInfo;
        public List<PracticInfo> lpi = new List<PracticInfo>();

        public InfoPage(string header, string lower, List<PracticInfo> lpi)
        {
            this.topWelcomeInfo = header;
            this.downWelcomeInfo = lower;
            this.lpi = lpi;
        }
    } 
}