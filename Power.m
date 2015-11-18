%{
example.Power (computed)  # LFP power in each frequency band
-> example.LFP
-> example.FrequencyBand
-----
power :float  # mV^2 Hz -- average power in the band
%}

classdef Power < dj.Relvar & dj.AutoPopulate
    methods(Access=protected)
        function makeTuples(self, key)
            % fetch required data 
            [lo, hi] = fetch1(example.FrequencyBand & key, 'freq_lo', 'freq_hi');
            [signal, dt] = fetch1(example.LFP & key, 'voltage', 'dt');
            % compute
            signal = band_pass_filter(signal, lo, hi, dt);
            key.power = compute_average_power(signal, dt);
            % submit
            self.insert(key)
        end
    end
end
