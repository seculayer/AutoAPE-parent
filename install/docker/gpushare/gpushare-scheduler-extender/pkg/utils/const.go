package utils

const (
	ResourceName = "nvidia.com/gpu-mem"
	CountName    = "nvidia.com/gpu-count"

	EnvNVGPU              = "NVIDIA_VISIBLE_DEVICES"
	EnvResourceIndex      = "NVIDIA_COM_GPU_MEM_IDX"
	EnvResourceByPod      = "NVIDIA_COM_GPU_MEM_POD"
	EnvResourceByDev      = "NVIDIA_COM_GPU_MEM_DEV"
	EnvAssignedFlag       = "NVIDIA_COM_GPU_MEM_ASSIGNED"
	EnvResourceAssumeTime = "NVIDIA_COM_GPU_MEM_ASSUME_TIME"
)
