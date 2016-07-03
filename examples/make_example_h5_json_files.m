%% Stimuli
piezo_command = [1 2 3 4 5 4 3 2 1];
command_align = [1 2 3 4 5 4 3 2 1].*0 + 5;
sample_rate = 80E3;
name = 'test_stim2';

ext = '.h5';
h5filepath = [name ext];
h5create(h5filepath,'/daq/count/',[1 inf],'Datatype','double',...
        'ChunkSize',[1 1000],'Deflate',6);
h5writeatt(h5filepath,'/daq','samplerate',sample_rate)

h5create(h5filepath,['/daq' '/' 'piezo_command'],[size(piezo_command)],'Datatype','double');
h5write(h5filepath,['/daq' '/' 'piezo_command'],piezo_command);
h5writeatt(h5filepath,['/daq' '/' 'piezo_command'],'id','1');
h5writeatt(h5filepath,['/daq' '/' 'piezo_command'],'units','volts');

h5create(h5filepath,['/daq' '/' 'command_align'],[size(command_align)],'Datatype','double');
h5write(h5filepath,['/daq' '/' 'command_align'],command_align);
h5writeatt(h5filepath,['/daq' '/' 'command_align'],'id','2');
h5writeatt(h5filepath,['/daq' '/' 'command_align'],'units','volts');

%% protocol
sample_rate = 80E3;

name = 'protocol_test';
ext = '.json';
jsonfp = [name ext];

p.name = name;
p.sample_rate = sample_rate;
t
p.stims(1).name = 'stim1';
p.stims(1).fp = {'folder','subfolder','stim1'};
p.stims(1).reps = 2;
p.stims(2).name = 'stim2';
p.stims(2).fp = {'folder','subfolder','stim2'};
p.stims(2).reps = 4;

p.n_stims = numel(p.stims);
[~] = savejson('',p,jsonfp);
jo_p=loadjson(jsonfp);

%% metadata

meta.exp_time = datestr(now,30);
meta.exp_name = 'testing';
meta.fly_age = '6';
meta.genotype = 'test';
meta.fly_name = 'test';
meta.fly_sex = 'test';        
meta.prep_type = 'test';
meta.platform_type = 'test';
meta.piezo_travel = 'test';
meta.piezo_type = 'test';
meta.piezo_servo = 'test';
meta.piezo_amp = 'test';        
meta.amplifier_name = 'Multiclamp 700B';
meta.camera_name = 'ORCA FLASH 4.0';
meta.piezo_manipulator = 'Sensapex right-handed heavy-load';
meta.electrode_manipulator = 'Sutter MP-285';
meta.hook_manipulator = 'Sutter MP-225';
meta.daq_channels = 'test';
meta.daq_rate = 'test';

name = 'metadata_test';
ext = '.json';
jsonfp = [name ext];

[~] = savejson('',meta,jsonfp);
jo_m=loadjson(jsonfp);
