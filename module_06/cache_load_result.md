# Оценка работы сервиса под нагрузкой
## Без кэширования
-----------------------------------------------------------
 **Running 1m test @ http://localhost:8081/**                
 **1 threads and 1 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------| 
  |  Latency   |  1.92ms |   0.86ms | 23.66ms |  97.53%   |
  |  Req/Sec   | 533.88  |   38.96  | 610.00  |  68.83%   |

  |Latency Distribution|   50% |   75% |   90% |   99% |
  |--------------------|-------|-------|-------|-------|
  |                    | 1.79ms| 2.01ms| 2.33ms| 3.23ms|

31905 requests in 1.00m, 9.07MB read  
Requests/sec:    531.45  
Transfer/sec:    154.66KB
***********************************************************
**Running 1m test @ http://localhost:8081/**  
**10 threads and 10 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 22.23ms |   4.64ms | 208.41ms|   86.75%  |
  |  Req/Sec   | 45.07   |   6.06   |  60.00  |   94.28%  |

  |Latency Distribution|  50%  |  75%  |  90%  |  99%  |
  |--------------------|-------|-------|-------|-------|
  |                    |21.54ms|23.48ms|26.12ms|38.90ms|

27039 requests in 1.00m, 7.76MB read  
Requests/sec:    450.32  
Transfer/sec:    132.37KB 
***********************************************************
**Running 1m test @ http://localhost:8081/**  
**50 threads and 50 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 62.75ms |  82.61ms |379.07ms |  85.71%   |
  |  Req/Sec   | 20.97   |  12.95   | 30.00   |  66.67%   |

  |Latency Distribution|  50%  |  75%  |   90%  |   99%  |
  |--------------------|-------|-------|--------|--------|
  |                    |29.60ms|34.72ms|248.18ms|379.07ms|
84 requests in 1.00m, 24.54KB read
Requests/sec:      1.40
Transfer/sec:     418.27B

## С кэшированием
***********************************************************
**Running 1m test @ http://localhost:8082/**  
**1 threads and 1 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 1.03ms  |  0.86ms  | 18.99ms |  98.65%   |
  |  Req/Sec   | 1.04k   | 82.32    |  1.20k  |  72.33%   |

  |Latency Distribution|  50%  |  75%  |   90%  |   99%  |
  |--------------------|-------|-------|--------|--------|
  |                    | 0.93ms| 1.00ms|  1.10ms|  3.94ms|

62004 requests in 1.00m, 17.86MB read  
Requests/sec:   1032.93  
Transfer/sec:    304.63KB  
***********************************************************
**Running 1m test @ http://localhost:8082/**  
**10 threads and 10 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 9.49ms  |  2.87ms  | 194.12ms|   96.13%  |
  |  Req/Sec   | 106.85  |    9.11  | 140.00  |   77.33%  |

  |Latency Distribution|  50%  |  75%  |   90%  |   99%  |
  |--------------------|-------|-------|--------|--------|
  |                    | 8.98ms| 9.88ms| 10.90ms| 22.60ms|

63868 requests in 1.00m, 18.17MB read  
Requests/sec:   1063.52  
Transfer/sec:    309.81KB  
***********************************************************
**Running 1m test @ http://localhost:8082/**
**50 threads and 50 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 166.22ms|  119.93ms| 313.41ms|   67.65%  |
  |  Req/Sec   |  6.59   |   3.18   | 10.00   |   26.47%  |

  |Latency Distribution|   50%  |   75%  |   90%  |   99%  |
  |--------------------|--------|--------|--------|--------|
  |                    |261.87ms|267.71ms|280.08ms|313.41ms|

34 requests in 1.00m, 9.98KB read  
Requests/sec:      0.57  
Transfer/sec:     170.15B
***********************************************************
