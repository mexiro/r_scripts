library(RCurl)

headerFields =
  c(Accept = "text/xml",
    Accept = "multipart/*",
    'Content-Type' = "text/xml; charset=utf-8",
    SOAPAction = "https://www.dataaccess.com/webservicesserver/NumberConversion.wso")



body = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum>150</ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>'

h = basicTextGatherer()
R <- curlPerform(url = "https://www.dataaccess.com/webservicesserver/NumberConversion.wso",
            httpheader = headerFields,
            postfields = body,verbose=TRUE,
            writefunction = h$update)

body <- h$value()

library("methods")
library("XML")


# Convert the input xml file to a data frame. WOW
xmldataframe <- xmlToDataFrame(body) 

print(xmldataframe)

