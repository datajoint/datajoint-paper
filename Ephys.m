%{
example.Ephys (manual)  # recording from the electrophysiology rig
->example.Recording
-----
sampling_rate :int  # (Hz) ephys acquisition system sampling rate
ephys_times :longblob # (s) acquisition sample times
%}

classdef Ephys < dj.Relvar & dj.AutoPopulate
    methods(Access=protected)
        function makeTuples(self, key)
              filename = fetch1(example.Recording & key, 'ephys_file')
              [key.sampling_rate, key.ephys_times] = ephysReadTimes(filename)
              self.insert(key)
        end
    end
end
