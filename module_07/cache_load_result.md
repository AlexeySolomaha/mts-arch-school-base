# Оценка работы сервиса под нагрузкой
## Без кэширования
-----------------------------------------------------------
 **Running 1m test @ http://localhost:8081/**                
 **1 threads and 1 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------| 
  |  Latency   |  2.41ms |   0.99ms | 30.90ms |  75.87%   |
  |  Req/Sec   | 406.71  |  199.24  |  1.31k  |  93.83%   |

  |Latency Distribution|   50% |   75% |   90% |   99% |
  |--------------------|-------|-------|-------|-------|
  |                    | 2.54ms| 2.83ms| 3.24ms| 4.38ms|

24314 requests in 1.00m, 6.99MB read  
Requests/sec:    404.92  
Transfer/sec:    119.23KB
***********************************************************
**Running 1m test @ http://localhost:8081/**  
**10 threads and 10 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 20.33ms |   4.26ms |  73.38ms|   72.34%  |
  |  Req/Sec   | 49.12   |   7.04   |  70.00  |   57.37%  |

  |Latency Distribution|  50%  |  75%  |  90%  |  99%  |
  |--------------------|-------|-------|-------|-------|
  |                    |20.03ms|22.68ms|25.56ms|32.45ms|

29474 requests in 1.00m, 8.48MB read  
Requests/sec:    490.72  
Transfer/sec:    144.52KB 
***********************************************************
**Running 1m test @ http://localhost:8081/**  
**50 threads and 50 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   | 97.47ms |  24.95ms |508.56ms |  83.20%   |
  |  Req/Sec   | 10.58   |   3.02   | 30.00   |  87.35%   |

  |Latency Distribution|  50%  |  75%  |   90%  |   99%  |
  |--------------------|-------|-------|--------|--------|
  |                    |94.25ms|106.3ms|120.41ms|168.18ms|
30942 requests in 1.00m, 8.90MB read
Requests/sec:     515.06
Transfer/sec:     151.64B

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
  |  Latency   | 2.18ms  |  847.06us|  23.25ms|   91.88%  |
  |  Req/Sec   | 455.04  |   59.97  | 555.00  |   74.33%  |

  |Latency Distribution|  50%  |  75%  |   90%  |   99%  |
  |--------------------|-------|-------|--------|--------|
  |                    |11.39ms|12.82ms| 15.21ms| 21.84ms|

50472 requests in 1.00m, 14.51MB read  
Requests/sec:    840.26  
Transfer/sec:    247.37KB  
***********************************************************
**Running 1m test @ http://localhost:8082/**
**50 threads and 50 connections**
  |Thread Stats|   Avg   |   Stdev  |   Max   | +/- Stdev |
  |------------|---------|----------|---------|-----------|
  |  Latency   |  64.24ms|   29.31ms| 589.73ms|   96.22%  |
  |  Req/Sec   |  16.06  |   5.08   | 40.00   |   59.36%  |

  |Latency Distribution|   50%  |   75%  |   90%  |   99%  |
  |--------------------|--------|--------|--------|--------|
  |                    | 60.24ms| 68.92ms| 79.36ms|121.73ms|

47841 requests in 1.00m, 13.75KB read  
Requests/sec:     796.36  
Transfer/sec:     234.45KB
***********************************************************
