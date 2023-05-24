local frandom = io.open("/dev/urandom", "rb")
local d = frandom:read(4)
math.randomseed(d:byte(1) + (d:byte(2) * 256) + (d:byte(3) * 65536) + (d:byte(4) * 4294967296))

id_prefix = '646cf58269189b39d7'
start_var = 8716091
max = 1000

request = function()
  author_id = id_prefix .. string.format("%x", math.random(start_var, start_var + max))
  headers = {}
  headers["Content-Type"] = "application/json"
  body = ''
  return wrk.format("GET", "/authors/".. author_id, headers, body)
end
