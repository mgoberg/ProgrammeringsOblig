# progOblig1
# Det norske flagget
base-flagg = rectangle(500, 300, "solid", "fire-brick")
kors-hvit-vertikal = rectangle(80, 300, "solid", "ivory")
kors-hvit-horistonal = rectangle(500, 80, "solid", "ivory")
kors-blaa-vertikal = rectangle(50, 300, "solid", "midnight-blue")
kors-blaa-horisontal = rectangle(500, 50, "solid", "midnight-blue")


flagg = underlay-xy(base-flagg, 0, 0, # Bygger flagget
  overlay-xy(kors-blaa-vertikal, -150, 0,
    overlay-xy(kors-blaa-horisontal, 0, -120,
      overlay-xy(kors-hvit-vertikal, -135, 0,
        overlay-xy(kors-hvit-horistonal, 0, -105, 
          base-flagg)))))


 
flagg # Printer flagget