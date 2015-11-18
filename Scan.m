%{
common.Scan (manual) # scanimage scan info
->common.Session
scan_idx : smallint # scanimage-generated index
-----
surfz              :float  # (um) z-coord at pial surface
depth=0            :int  # manual depth measurement
laser_wavelength   :float    # (nm)
laser_power        :float    # (mW) to brain
cortical_area="V1" :enum('other','unknown','V1','LM','AL','PM')
scan_notes = ""    :varchar(4095)  #  free-notes
scan_ts = CURRENT_TIMESTAMP : timestamp   # don't edit
%}

classdef Scan < dj.Relvar
end
