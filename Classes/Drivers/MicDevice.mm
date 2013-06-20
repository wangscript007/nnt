
# import "Core.h"
# import "MicDevice.h"

NNT_BEGIN_CXX
NNT_BEGIN_NS(mic)

real Device::SampleRate()
{
    real ret;
    OSStatus err;
	AudioDeviceID deviceID = 0;
    
	// get the default input device
	AudioObjectPropertyAddress addr;
	UInt32 size;
	addr.mSelector = kAudioHardwarePropertyDefaultInputDevice;
	addr.mScope = kAudioObjectPropertyScopeGlobal;
	addr.mElement = 0;
	size = sizeof(AudioDeviceID);
	err = AudioHardwareServiceGetPropertyData(kAudioObjectSystemObject, &addr, 0, NULL, &size, &deviceID);
	if (err) return ret;
    
	// get its sample rate
	addr.mSelector = kAudioDevicePropertyNominalSampleRate;
	addr.mScope = kAudioObjectPropertyScopeGlobal;
	addr.mElement = 0;
	size = sizeof(Float64);
	err = AudioHardwareServiceGetPropertyData(deviceID, &addr, 0, NULL, &size, &ret);
    
	return ret;
    
}

NNT_END_NS
NNT_END_CXX