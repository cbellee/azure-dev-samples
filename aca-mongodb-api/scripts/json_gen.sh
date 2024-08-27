
# https://json-generator.com/

[
  '{{repeat(100)}}',
  {
    firstName: '{{firstName()}}',
    lastName: '{{surname()}}',
    streetAddress: '{{integer(100, 999)}} {{street()}}',
    city: '{{random("Sydney","Melbourne","Brisbane","Adelaide","Perth","Hobart","Darwin","Canberra")}}',
    state: '{{random("NSW","VIC","QLD","SA","WA","TAS","NT","ACT")}}',
    zip: '{{integer(2000,3000)}}',
    country: 'Australia'
  }
]

[
  '{{repeat(100)}}',
  {
    flightNumber: '{{random("QF","BA","EM","NZ")}}{{integer(100,300)}}',
    carrier: '{{random("Qantas","British Airways","Emirates","Air New Zealand")}}',
    origin: '{{random("Sydney","Melbourne","London","Los Angeles","Mexico City","Paris","Berlin","Madrid")}}',
    destination: '{{random("Adelaide","Perth","Glasgow","Amsterdam","Oslo","NewYork","HongKong","Tokyo")}}',
    departureDate: '{{date(new Date(2024,5,0), new Date(2024,6,0), "YYYY-MM-dd-hh-mm")}}',
    arrivalDate: '{{date(new Date(2024,5,0), new Date(2024,6,0), "YYYY-MM-dd-hh-mm")}}',
    price: '{{integer(700,3000)}}'
  }
]
