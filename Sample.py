#!/usr/local/bin/python3.3

#response = input('This is a test. Type anything to echo, then press Enter key to exit.')

#print('Echo: '+ response)

#exit()

# urlget_Test1() uses urllib to attemp a HTTP Request to access www.mycase.in.gov.
# Python's urllib's normally follows a page redirection, HTTP 302, but because of the site
# requiring to set up a cookie, urllib fails to redirect because it would cause an infinite loop.
# Here's the site's response:

#Loading page: http://mycase.in.gov/default.aspx

#HTTP Headers:

#HTTP/1.1 302 Found
#Cache-Control: private
#Content-Type: text/html; charset=utf-8
#Location: /Login.aspx?ReturnUrl=%2fdefault.aspx
#Server: Microsoft-IIS/7.5
#X-AspNet-Version: 2.0.50727
#X-Powered-By: ASP.NET
#Date: Fri, 21 Feb 2014 21:25:21 GMT
#Connection: keep-alive
#Content-Length: 162

# urlget_Test1(msg) attempts to fetch an HTML page from a server
# but it doesn't automatically follow the server's REDIRECT response.

# urlget_TestTwo resolves the HTTP 302 REDIRECT problem by using
# python's automatically-follow-HTTP-REDIRECT feature, but it fails 
# to complete it's move because the site being tested, mycase.in.gov
# issues a cookie with its REDIRECT response and expects the same
# cookie to be returned by the client upon moving to the https://
# redirection url.
# 
# Currently, urlget_TestTwo isn't handling the cookie correctly
# so for now it mearly returns the HTML redirection page fetched 
# from the server.

# urlget_Test3() attempts to move to the REDIRECT page by importing
# the cookie used by Firefox for the same site.  This method per 
# https://ubuntuincident.wordpress.com/2011/09/05/download-pages-with-wget-that-are-protected-by-cookies/
# http://ubuntuincident.wordpress.com/2011/09/11/download-cookie-protected-pages-with-python-using-cookielib-part-2/
# http://ubuntuincident.wordpress.com/2011/11/08/download-login-protected-pages-with-python-using-mechanize-and-splinter-part-3/
#
# Hopefully there's a better way to do this without involving Firefox's cookies, which, incidently are no longer
# stored in the user's home folder in the cookies.txt file, but now are saved in a Sqlite file.

# Another outstanding issue with accessing mycase.in.gov is programatically getting past its captcha.
# One possible way around it is to programattically choose the "Speak Captcha" link on the page.  With that
# python could use a speech-to-text library to convert the letters to text, then feed that back into the_page
# captcha input field.

# Once past it, the python app should be able to drive the site and fetch the case records.

#-------------------------------------------
def Main():
  gMsg = 'Main()'
  
  print(gMsg)
  
  #urlget_Test1(gMsg)
  urlget_TestTwo()
  #urlget_Test3()

#-------------------------------------------
def urlget_Test3():
  
  print('urlget_Test3()')
  
  #import os, cookielib, urllib2  # python 2.x
  
  import os, http.cookiejar
  import urllib.parse
  import urllib.request
  import urllib.response
  
  #cj = cookielib.MozillaCookieJar()
  cj = http.cookiejar.MozillaCookieJar()
  cj.load(os.path.join(os.path.expanduser("~"), ".netscape", "cookies.txt"))
  #opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
  opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
  r = opener.open("http://mycase.in.gov/default.aspx")
  print(r.read())
#-------------------------------------------
def urlget_Test1(msg):

  return
  
  import urllib.parse
  import urllib.request
  import urllib.response

  print('urlget_Test1()')

  #url = 'http://www.someserver.com/cgi-bin/register.cgi'
  url = 'http://mycase.in.gov/default.aspx'
  user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
  values = {'name' : 'Michael Foord',
	    'location' : 'Northampton',
	    'language' : 'Python' }
  headers = { 'User-Agent' : user_agent }

  print('Header: ' + str(headers))

  data = urllib.parse.urlencode(values)
  #req = urllib.request.Request(url, data, headers)
  req = urllib.request.Request(url, b'User-Agent: Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)')
  #req = urllib.request.Request(url, headers)
  #req = urllib.request.Request(url)
  response = urllib.request.urlopen(req)
  the_page = response.read()
  print(the_page)
  exit()
  try:
    response = urllib.request.urlopen(req)
  except urllib.error.HTTPError as e:
    print(e.code)
    print(e.read())
    exit(1)
  else:  
    the_page = response.read()
    print(the_page)
  exit()  
#-------------------------------------------
def urlget_TestTwo():

# The following works to request a page from mycase.in.gov, which returns HTTP 302 response
# and requires setting a cookie in order to follow the redirection.

  #import urllib2
  import urllib.request
  import urllib.parse
  import ssl

  print('urlget_TestTwo()')

  url = "http://stackoverflow.com/questions/9926023/handling-rss-redirects-with-python-urllib2"

  url = 'http://mycase.in.gov/default.aspx'

  url = 'https://mycase.in.gov/Search.aspx?ID=100&NodeID=8800,8810,8811,8830,8831&NodeDesc=Washington%20County'
  #p = urllib2.build_opener(urllib2.HTTPCookieProcessor).open(url)
  p = urllib.request.build_opener(urllib.request.HTTPCookieProcessor).open(url)

  print(p.read())

  exit()  
#-------------------------------------------

Main()
  