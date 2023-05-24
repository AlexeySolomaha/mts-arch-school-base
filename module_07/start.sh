echo "WITHOUT CACHE"
#wrk -d 10 -t 10 -c 10 --latency -s ./get.lua http://localhost:8081/
# Время 60 количество потоков  1 количество соединений  1
wrk -d 60 -t  1 -c  1 --latency -s ./get.lua http://localhost:8081/
# Время 60 количество потоков 10 количество соединений 10
wrk -d 60 -t 10 -c 10 --latency -s ./get.lua http://localhost:8081/
# Время 60 количество потоков 50 количество соединений 50
wrk -d 60 -t 50 -c 50 --latency -s ./get.lua http://localhost:8081/
echo ''

echo "WITH CACHE"
#wrk -d 10 -t 10 -c 10 --latency -s ./get.lua http://localhost:8082/
# Время 60 количество потоков  1 количество соединений  1
wrk -d 60 -t  1 -c  1 --latency -s ./get.lua http://localhost:8082/
# Время 60 количество потоков 10 количество соединений 10
wrk -d 60 -t 10 -c 10 --latency -s ./get.lua http://localhost:8082/
# Время 60 количество потоков 50 количество соединений 50
wrk -d 60 -t 50 -c 50 --latency -s ./get.lua http://localhost:8082/
