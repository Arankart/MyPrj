from asyncore import write
from tokenize import blank_re
import requests as rqs
from bs4 import BeautifulSoup


site_url = "https://ruward.ru"
emails = []
company_obj = []

def find_name():
    text = "Привет, у меня был @тяжёлый день"
    word = "день"

    index = text.find(word)
    print(f"Индекс = {index}")


    index_2 = re.search(word, text)
    print(f"Индекс 2 = {index}")


    if index == word:
        print("Первый спобой!")
    elif index_2 == word:
        print("Второй спобой!")
    else:
        print("Я ничего не нашёл(")

    if word in text:
        print("А обычный способ сработал :D")
    else:
        print("Обычный способ тоже не сработал :S")
        

    

class Company():
    company_page = ""
    site_url = ""
    name = ""
    phone_num = ""
    email = ""


def pars_companys_date():
    url = "https://marketing-tech.ru/company_tags/video-production/page/1/"
    page = rqs.get(url)
    html = BeautifulSoup(page.text, 'lxml')
    allNames = html.find_all('a', class_="h3")
    
    print(f'Всего элементов: {len(allNames)}')

    for el in allNames:
        cmpn = Company()
        cmpn.company_page = el.get('href')
        print(cmpn.company_page)

        #Парсингг емейлов, телефонов и адресов сайтов со страницы компании
        page = rqs.get(cmpn.company_page)
        print(page.status_code)

        page_html = BeautifulSoup(page.text, 'lxml')


        index = page_html.text.find("Сайт")
        splitted_text = page_html.text.split(" ", )

        site_str = ""
        site_str_elements = []

        i = 0
        for el in splitted_text:
            splitted_text[i] = el.replace('\n', '')
            splitted_text[i] = splitted_text[i].replace('\t', '')
            if "Сайт" in el:
                site_str = el
                site_str_new = site_str.split('т')
                site_str = site_str_new[1] 
                site_str = site_str.replace('\n', '')
                site_str_new = site_str.split('У')
                cmpn.site_url = site_str_new[0]

            i += 1
            
        print(f'Нашёл аресс сайта: {cmpn.site_url}')


    # print(page_html.text)
    # cmpn.site_url = page_html.find_all('a', class_="td")
    # print(f'Сайт компании: {page_html.text}')


    # for el in allNames:

    #     cmpn = Company()
    #     href = el.get('href')
    #     cmpn.name = el.text

    #     # print(href)

    #     if href[0] == '/':
    #         cmpn.company_page = site_url + href

    #         #Парсингг емейлов, телефонов и адресов сайтов со страницы компании
    #         comp_page = rqs.get(cmpn.company_page)
    #         company_html = BeautifulSoup(comp_page.text, 'lxml')
    #         email = company_html.find('a', class_="mail")
    #         phone = company_html.find('span', class_="phone")
    #         siteAg = company_html.find('h3', class_="mainurl")

    #         fullHref = str(siteAg)
    #         newAllHref = fullHref.split('"')
    #         link = newAllHref[3]

    #         try:
    #             cmpn.email = email.text
    #         except:
    #             cmpn.email = "Емейл отсутсвует"
            
    #         try:
    #             cmpn.phone_num = phone.text
    #         except:
    #             cmpn.phone_num = "Номер отсутсвует"

    #         #Добавляем объект в отдельный список 
    #         company_obj.append(cmpn)

    #         emails.append(cmpn.email)

    #         print(cmpn.email)

    #         #print(f"{cmpn.name} \nPage adress: {cmpn.company_page} \nPhone number: {cmpn.phone_num} \neMail: {cmpn.email} \n")

    #     else:
    #         pass
    #         #print(f"У {cmpn.name} нету страницы этого сайта \n")

    
    return company_obj


def main():
    pars_companys_date()
#Запуск программы
main()