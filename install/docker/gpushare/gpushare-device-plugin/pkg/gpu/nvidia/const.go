package nvidia

import (
	pluginapi "k8s.io/kubernetes/pkg/kubelet/apis/deviceplugin/v1beta1"
)

// MemoryUnit describes GPU Memory, now only supports Gi, Mi
type MemoryUnit string

const (
	resourceName  = "nvidia.com/gpu-mem"
	resourceCount = "nvidia.com/gpu-count"
	serverSock    = pluginapi.DevicePluginPath + "nvidiagpushare.sock"

	OptimisticLockErrorMsg = "the object has been modified; please apply your changes to the latest version and try again"

	allHealthChecks             = "xids"
	containerTypeLabelKey       = "io.kubernetes.docker.type"
	containerTypeLabelSandbox   = "podsandbox"
	containerTypeLabelContainer = "container"
	containerLogPathLabelKey    = "io.kubernetes.container.logpath"
	sandboxIDLabelKey           = "io.kubernetes.sandbox.id"

	envNVGPU               = "NVIDIA_VISIBLE_DEVICES"
	EnvResourceIndex       = "NVIDIA_COM_GPU_MEM_IDX"
	EnvResourceByPod       = "NVIDIA_COM_GPU_MEM_POD"
	EnvResourceByContainer = "NVIDIA_COM_GPU_MEM_CONTAINER"
	EnvResourceByDev       = "NVIDIA_COM_GPU_MEM_DEV"
	EnvAssignedFlag        = "NVIDIA_COM_GPU_MEM_ASSIGNED"
	EnvResourceAssumeTime  = "NVIDIA_COM_GPU_MEM_ASSUME_TIME"
	EnvResourceAssignTime  = "NVIDIA_COM_GPU_MEM_ASSIGN_TIME"

	GiBPrefix = MemoryUnit("GiB")
	MiBPrefix = MemoryUnit("MiB")
)
