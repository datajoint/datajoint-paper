%{ 
example.Session (manual)  # an experiment recording session for the given animal
-> example.Animal 
session :smallint  # recording session number for this animal
----
user              :varchar(16)    # experimenter's name
session_date      :date           # the date on which the recording session began
session_folder="" :varchar(200)   # file path to the recorded data
notes=""          :varchar(2000)  # free-hand session notes 
timestamp=CURRENT_TIMESTAMP :timestamp  # automatic timestamp
%}

classdef Session < dj.Relvar
end
