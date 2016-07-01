labview-phys-io
============================================

Purpose:
- Acquire frames from a Hamamatsu ORCA-Flash4.0 V2 sCMOS camera (over CameraLink)
- Send data to control stimulation, event triggering etc., over NI boards
- Record data from amplifiers etc., over NI boards

Requires:
- Windows 7 or 10 (64-bit)
- 64-bit DCAM API
- LabVIEW 2015 (64-bit)
- NI Vision (only for ROIs on displayed acquisition)
- NIDAQmx 15.1 (or 14.5)
- newest hdf5 libraries
- h5labview plugin (easier/less broken than the NI provided plugin)
