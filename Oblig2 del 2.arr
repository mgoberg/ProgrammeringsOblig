include gdrive-sheets
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
table = 
  load-table:  komponent :: String, energi :: Number
  source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

distance-travelled-per-day = 10 #Mil
distance-per-unit-of-fuel = 5 #Mil
energy-per-unit-of-fuel = 10 #kWh

energy-per-day = 
  num-round(distance-travelled-per-day / distance-per-unit-of-fuel) * energy-per-unit-of-fuel
                                                        
fun energi-to-number(str :: String) -> Number:
  doc: "Hvis str ikke er et tall, sett til 0"
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => energy-per-day
  end
where:
  energi-to-number("") is energy-per-day
  energi-to-number("48") is 48
end

transform-column(table, "energi", energi-to-number)

summering-av-energi = sum(table, "energi")

summering-av-energi
