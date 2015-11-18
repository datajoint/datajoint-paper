@schema
class LFP(dj.Imported):
definition = """ # Local Field Potential signal from one electrode 
->example.Ephys
channel :int  # channel number
-----
voltage :longblob  # (uV) raw local field potential signal
"""
