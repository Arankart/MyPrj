from asyncore import write
import numbers
from tokenize import blank_re
import requests as rqs
from bs4 import BeautifulSoup
import csv


site_url = "https://ruward.ru"
emails = []
company_obj = []

class Company():
    company_page = ""
    site_url = ""
    name = ""
    phone_num = ""
    email = ""


def pars_companys_date():
    url = "https://ruward.ru/index-ruward/united-web-rating-2019/"
    page = rqs.get(url)
    html = BeautifulSoup(page.text, 'lxml')
    allNames = html.find_all('a', class_="companyratingname")

    for el in allNames:

        cmpn = Company()
        href = el.get('href')
        cmpn.name = el.text

        # print(href)

        if href[0] == '/':
            cmpn.company_page = site_url + href

            #Парсингг емейлов, телефонов и адресов сайтов со страницы компании
            comp_page = rqs.get(cmpn.company_page)
            company_html = BeautifulSoup(comp_page.text, 'lxml')
            email = company_html.find('a', class_="mail")
            phone = company_html.find('span', class_="phone")
            siteAg = company_html.find('h3', class_="mainurl")

            fullHref = str(siteAg)
            newAllHref = fullHref.split('"')
            link = newAllHref[3]

            try:
                cmpn.email = email.text
            except:
                cmpn.email = "Емейл отсутсвует"
            
            try:
                cmpn.phone_num = phone.text
            except:
                cmpn.phone_num = "Номер отсутсвует"

            #Добавляем объект в отдельный список 
            company_obj.append(cmpn)

            emails.append(cmpn.email)

            print(cmpn.email)

            #print(f"{cmpn.name} \nPage adress: {cmpn.company_page} \nPhone number: {cmpn.phone_num} \neMail: {cmpn.email} \n")

        else:
            pass
            #print(f"У {cmpn.name} нету страницы этого сайта \n")

    
    return company_obj

def writeToFile(text):
    write = open("mails.csv", "w", newline='')
    for el in text:
        writer = csv.writer(el)

    print(f"Данные записаны в файл")

#Все задачи для программы
def main():
    pars_companys_date()
    print(f"Полученены данные о {len(company_obj)} компаний")
    # writeToFile(emails)

#Запуск программы
main()