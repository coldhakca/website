---
title: atlas_tools
layout: readmepage
permalink: /atlas_tools/
---
# atlas_tools

Misc CLI tools that use data from RIPE atlas. 

Note: These will likely be rewritten as a [ripe-atlas-tools renderer](http://ripe-atlas-tools.readthedocs.org/en/master/plugins.html).

## tools and usage

*	SSL Measurement
*	Traceroute data visualization
*	Maxmind GeoIP data integration

### Traceroute Measurement

`atlas-examine-traceroute-measurement.py` lets you examine a traceroute measurement in detail, printing out the ASN name, IPs and RTTs as returned by the probe.

#### Usage

```
python atlas-examine-traceroute-measurement.py "https://atlas.ripe.net/api/v2/measurements/3200170/results?start=1451433600&stop=1451519999&format=json"
```

#### Sample Output

```
Source:    75.159.240.66
Dest:      192.160.102.255
Probe ID:  10441
Type:      Traceroute
Proto:     ICMP
0 192.168.0.1: 0.831 ms (64) 192.168.0.1: 0.568 ms (64) 192.168.0.1: 0.538 ms (64)  None 
1 192.168.1.254: 1.13 ms (63) 192.168.1.254: 0.819 ms (63) 192.168.1.254: 0.813 ms (63)  None 
2 10.145.154.1: 16.212 ms (62) 10.145.154.1: 12.515 ms (62) 10.145.154.1: 7.792 ms (62)  None 
3 75.154.217.106: 28.315 ms (249) 75.154.217.106: 24.238 ms (249) 75.154.217.106: 24.201 ms (249)  None 
4 *: False ms (0) *: False ms (0) *: False ms (0)  False 
5 184.105.222.2: 60.436 ms (55) 184.105.222.2: 59.901 ms (55) 184.105.222.2: 64.38 ms (55)  AS6939 Hurricane Electric, Inc. 
6 184.105.223.217: 60.007 ms (56) 184.105.223.217: 59.822 ms (56) 184.105.223.217: 60.027 ms (56)  AS6939 Hurricane Electric, Inc. 
7 184.105.223.213: 53.923 ms (57) 184.105.223.213: 54.086 ms (57) 184.105.223.213: 63.777 ms (57)  AS6939 Hurricane Electric, Inc. 
8 216.66.74.58: 54.165 ms (247) 216.66.74.58: 53.925 ms (247) 216.66.74.58: 58.292 ms (247)  AS6939 Hurricane Electric, Inc. 
9 199.87.157.253: 79.079 ms (247) 199.87.157.253: 133.995 ms (247) 199.87.157.253: 61.683 ms (247)  AS18451 LES.NET 
10 192.160.102.255: 55.333 ms (246) 192.160.102.255: 66.312 ms (246) 192.160.102.255: 60.622 ms (246)  AS18451 LES.NET 

Source:    76.11.79.151
Dest:      192.160.102.255
Probe ID:  1118
Type:      Traceroute
Proto:     ICMP
0 192.168.0.1: 1.989 ms (64) 192.168.0.1: 1.544 ms (64) 192.168.0.1: 1.534 ms (64)  None 
1 10.92.64.1: 10.28 ms (63) 10.92.64.1: 12.208 ms (63) 10.92.64.1: 10.29 ms (63) 10.92.64.1: 12.232 ms (63) 10.92.64.1: 10.098 ms (63) 10.92.64.1: 12.025 ms (63)  None 
2 173.212.126.129: 10.817 ms (253) 173.212.126.129: 10.175 ms (253) 173.212.126.129: 10.294 ms (253)  AS11260 EastLink 
3 24.222.79.57: 10.598 ms (252) 24.222.79.57: 10.719 ms (252) 24.222.79.57: 10.29 ms (252)  AS11260 EastLink 
4 24.215.101.221: 10.593 ms (251) 24.215.101.221: 10.52 ms (251) 24.215.101.221: 10.81 ms (251)  AS11260 EastLink 
5 206.108.34.112: 45.677 ms (59) 206.108.34.112: 59.918 ms (59) 206.108.34.112: 29.91 ms (59)  None 
6 184.105.223.130: 30.282 ms (58) 184.105.223.130: 30.099 ms (58) 184.105.223.130: 30.45 ms (58)  AS6939 Hurricane Electric, Inc. 
7 184.105.223.221: 76.53 ms (57) 184.105.223.221: 61.52 ms (57) 184.105.223.221: 62.147 ms (57)  AS6939 Hurricane Electric, Inc. 
8 216.66.74.59: 55.407 ms (247) 216.66.74.59: 55.569 ms (247) 216.66.74.59: 217.962 ms (247)  AS6939 Hurricane Electric, Inc. 
9 192.160.102.255: 55.291 ms (246) 192.160.102.255: 55.817 ms (246) 192.160.102.255: 55.971 ms (246)  AS18451 LES.NET 

Source:    24.143.144.3
Dest:      192.160.102.255
Probe ID:  11864
Type:      Traceroute
Proto:     ICMP
0 192.168.1.1: 0.668 ms (64) 192.168.1.1: 0.434 ms (64) 192.168.1.1: 0.4 ms (64)  None 
1 10.205.132.1: 12.476 ms (254) 10.205.132.1: 9.747 ms (254) 10.205.132.1: 9.729 ms (254)  None 
2 *: False ms (0) *: False ms (0) *: False ms (0)  False 
3 64.140.112.117: 39.475 ms (252) 64.140.112.117: 35.535 ms (252) 64.140.112.117: 39.348 ms (252)  AS40788 Start Communications 
4 206.108.34.112: 46.08 ms (60) 206.108.34.112: 39.74 ms (60) 206.108.34.112: 39.993 ms (60)  None 
5 184.105.223.130: 37.891 ms (59) 184.105.223.130: 31.283 ms (59) 184.105.223.130: 29.824 ms (59)  AS6939 Hurricane Electric, Inc. 
6 184.105.223.221: 64.456 ms (58) 184.105.223.221: 65.636 ms (58) 184.105.223.221: 64.708 ms (58)  AS6939 Hurricane Electric, Inc. 
7 216.66.74.59: 201.054 ms (247) 216.66.74.59: 207.414 ms (247) 216.66.74.59: 168.478 ms (247)  AS6939 Hurricane Electric, Inc. 
8 192.160.102.255: 55.84 ms (246) 192.160.102.255: 60.455 ms (246) 192.160.102.255: 55.718 ms (246)  AS18451 LES.NET 

Source:    204.16.144.114
Dest:      192.160.102.255
Probe ID:  12095
Type:      Traceroute
Proto:     ICMP
0 192.168.160.1: 12.774 ms (64) 192.168.160.1: 0.386 ms (64) 192.168.160.1: 0.381 ms (64)  None 
1 204.16.144.113: 19.032 ms (63) 204.16.144.113: 1.527 ms (63) 204.16.144.113: 2.28 ms (63)  AS23523 Voyageur Internet Inc 
2 208.74.0.33: 3.788 ms (253) 208.74.0.33: 2.248 ms (253) 208.74.0.33: 3.111 ms (253)  AS23523 Voyageur Internet Inc 
3 204.16.144.25: 13.829 ms (252) 204.16.144.25: 10.02 ms (252) 204.16.144.25: 3.397 ms (252)  AS23523 Voyageur Internet Inc 
4 204.16.144.21: 4.991 ms (60) 204.16.144.21: 3.379 ms (60) 204.16.144.21: 3.412 ms (60)  AS23523 Voyageur Internet Inc 
5 204.16.144.65: 4.422 ms (250) 204.16.144.65: 3.532 ms (250) 204.16.144.65: 4.09 ms (250)  AS23523 Voyageur Internet Inc 
6 208.81.7.21: 5.31 ms (249) 208.81.7.21: 5.345 ms (249) 208.81.7.21: 4.403 ms (249)  AS18451 LES.NET 
7 199.87.157.253: 3.826 ms (248) 199.87.157.253: 3.368 ms (248) 199.87.157.253: 24.679 ms (248)  AS18451 LES.NET 
8 192.160.102.255: 4.091 ms (247) 192.160.102.255: 3.76 ms (247) 192.160.102.255: 5.903 ms (247)  AS18451 LES.NET 

<snip>
```

### SSL Measurement

`atlas-examine-ssl-measurement.py` lets you examine an SSL measurement in detail, printing out the `dst_addr` and details of the certificate chain as returned by the probe.

#### Usage

```
python atlas-examine-ssl-measurement.py https://atlas.ripe.net/api/v2/measurements/3198534/results?format=json
```

#### Sample Output

```
31.13.69.228
 0
  CertData:  [('C', 'US'), ('ST', 'CA'), ('L', 'Menlo Park'), ('O', 'Facebook, Inc.'), ('CN', '*.facebook.com')]
  SHA1:      86:7C:B2:93:94:87:87:8A:6E:4D:B2:52:36:AC:92:AA:76:F0:9D:E3
  SHA256:    0F:99:39:3D:53:18:AE:D8:48:B7:28:7E:5A:AC:FE:79:7C:C5:C5:71:FF:DF:F8:8C:B0:B8:D6:0B:30:4D:97:8F
 1
  CertData:  [('C', 'US'), ('O', 'DigiCert Inc'), ('OU', 'www.digicert.com'), ('CN', 'DigiCert High Assurance CA-3')]
  SHA1:      42:85:78:55:FB:0E:A4:3F:54:C9:91:1E:30:E7:79:1D:8C:E8:27:05
  SHA256:    21:EB:37:AB:4C:F6:EF:89:65:EC:17:66:40:9C:A7:6B:8B:2E:03:F2:D1:A3:88:DF:73:42:08:E8:6D:EE:E6:79
31.13.77.36
 0
  CertData:  [('C', 'US'), ('ST', 'CA'), ('L', 'Menlo Park'), ('O', 'Facebook, Inc.'), ('CN', '*.facebook.com')]
  SHA1:      86:7C:B2:93:94:87:87:8A:6E:4D:B2:52:36:AC:92:AA:76:F0:9D:E3
  SHA256:    0F:99:39:3D:53:18:AE:D8:48:B7:28:7E:5A:AC:FE:79:7C:C5:C5:71:FF:DF:F8:8C:B0:B8:D6:0B:30:4D:97:8F
 1
  CertData:  [('C', 'US'), ('O', 'DigiCert Inc'), ('OU', 'www.digicert.com'), ('CN', 'DigiCert High Assurance CA-3')]
  SHA1:      42:85:78:55:FB:0E:A4:3F:54:C9:91:1E:30:E7:79:1D:8C:E8:27:05
  SHA256:    21:EB:37:AB:4C:F6:EF:89:65:EC:17:66:40:9C:A7:6B:8B:2E:03:F2:D1:A3:88:DF:73:42:08:E8:6D:EE:E6:79
173.252.90.132
 0
  CertData:  [('C', 'US'), ('ST', 'CA'), ('L', 'Menlo Park'), ('O', 'Facebook, Inc.'), ('CN', '*.facebook.com')]
  SHA1:      86:7C:B2:93:94:87:87:8A:6E:4D:B2:52:36:AC:92:AA:76:F0:9D:E3
  SHA256:    0F:99:39:3D:53:18:AE:D8:48:B7:28:7E:5A:AC:FE:79:7C:C5:C5:71:FF:DF:F8:8C:B0:B8:D6:0B:30:4D:97:8F
 1
  CertData:  [('C', 'US'), ('O', 'DigiCert Inc'), ('OU', 'www.digicert.com'), ('CN', 'DigiCert High Assurance CA-3')]
  SHA1:      42:85:78:55:FB:0E:A4:3F:54:C9:91:1E:30:E7:79:1D:8C:E8:27:05
  SHA256:    21:EB:37:AB:4C:F6:EF:89:65:EC:17:66:40:9C:A7:6B:8B:2E:03:F2:D1:A3:88:DF:73:42:08:E8:6D:EE:E6:79
173.252.74.68
 0
  CertData:  [('C', 'US'), ('ST', 'CA'), ('L', 'Menlo Park'), ('O', 'Facebook, Inc.'), ('CN', '*.facebook.com')]
  SHA1:      86:7C:B2:93:94:87:87:8A:6E:4D:B2:52:36:AC:92:AA:76:F0:9D:E3
  SHA256:    0F:99:39:3D:53:18:AE:D8:48:B7:28:7E:5A:AC:FE:79:7C:C5:C5:71:FF:DF:F8:8C:B0:B8:D6:0B:30:4D:97:8F
 1
  CertData:  [('C', 'US'), ('O', 'DigiCert Inc'), ('OU', 'www.digicert.com'), ('CN', 'DigiCert High Assurance CA-3')]
  SHA1:      42:85:78:55:FB:0E:A4:3F:54:C9:91:1E:30:E7:79:1D:8C:E8:27:05
  SHA256:    21:EB:37:AB:4C:F6:EF:89:65:EC:17:66:40:9C:A7:6B:8B:2E:03:F2:D1:A3:88:DF:73:42:08:E8:6D:EE:E6:79
<snip>
```