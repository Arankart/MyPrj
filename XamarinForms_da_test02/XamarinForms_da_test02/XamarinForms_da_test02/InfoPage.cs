using System.Collections.Generic;

namespace XamarinForms_da_test02
{
    public class InfoPage
    {
        public string topWelcomeInfo;
        public string downWelcomeInfo;
        public List<PracticInfo> lpi = new List<PracticInfo>();
        public List<PracticInfo> back = new List<PracticInfo>()
                {
                    new PracticInfo("Тяга в наклоне", "Lower 3 text in this place", ""),
                    new PracticInfo("Верхний блок", "Lower 3 text in this place", ""),
                    new PracticInfo("Тяга гантели в наклоне на скамье", "Lower 3 text in this place", ""),
                    new PracticInfo("Нижняя тяга", "Lower 3 text in this place", ""),
                };

        public List<PracticInfo> biceps = new List<PracticInfo>()
                {
                    new PracticInfo("Подъём гантелей по очереди стоя", "Lower 3 text in this place", ""),
                    new PracticInfo("Подъём гантелей в тренажёре", "Lower 3 text in this place", ""),
                    new PracticInfo("Подъём в блоке", "Lower 3 text in this place", "")
                };

        public List<PracticInfo> breast = new List<PracticInfo>()
            {
            new PracticInfo("Разводки с гантелями лёжа", "Lower 3 text in this place", "https://clck.ru/ajdMA"),
            new PracticInfo("Сведения в тренажёре (бабочка) ", "Lower 3 text in this place", "https://clck.ru/ajdNA"),
            new PracticInfo("Сведения в кроссовере", "Lower 3 text in this place", "https://clck.ru/ajdN6"),
            new PracticInfo("Отжимания лежа", "Lower 3 text in this place", "https://clck.ru/ajdMV"),
        };

        public List<PracticInfo> triceps = new List<PracticInfo>()
            {
            new PracticInfo("Жим лёжа узким хватом", "Lower 3 text in this place", "https://clck.ru/ajdL3"),
            new PracticInfo("Сведения в блоке", "Lower 3 text in this place", "https://clck.ru/ajdL4"),
            new PracticInfo("Отжимания узким хватом", "Lower 3 text in this place", "https://clck.ru/ajdL6"),
            new PracticInfo("Французский жим", "Lower 3 text in this place", "https://clck.ru/ajdL9"),
        };

        public List<PracticInfo> legs = new List<PracticInfo>()
            {
            new PracticInfo("Присед", "Lower 3 text in this place", ""),
            new PracticInfo("Жим ногами", "Lower 3 text in this place", ""),
            new PracticInfo("Сведения ног в тренажёре", "Lower 3 text in this place", ""),
            new PracticInfo("Разведения ног в тренажёре", "Lower 3 text in this place", ""),
            new PracticInfo("Выпады", "Lower 3 text in this place", ""),
        };


        public InfoPage(string header, string lower, List<PracticInfo> lpi)
        {
            this.topWelcomeInfo = header;
            this.downWelcomeInfo = lower;
            this.lpi = lpi;
        }
    } 
}