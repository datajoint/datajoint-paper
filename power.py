@schema 
class Power(dj.Computed):
    definition = """  # LFP power in each frequency band
    -> LFP
    -> FrequencyBand
    -----
    power :float  # mV^2 Hz -- averge power in the band
    """

    def _make_tuples(self, key):
        # fetch required data
        lo, hi = (FrequencyBand() & key).fetch1['freq_lo', 'freq_hi']
        signal, dt = (LFP() & key).fetch1['voltage', 'dt']
        # compute
        signal = band_pass_filter(signal, lo, hi, dt)
        power = compute_average_power(signal, dt)
        # submit 
        self.insert1(dict(key, power=power))
