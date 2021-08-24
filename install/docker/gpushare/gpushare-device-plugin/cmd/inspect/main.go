package main

import (
	"flag"
	"fmt"
	"os"

	"k8s.io/api/core/v1"
)

const (
	resourceName         = "nvidia.com/gpu-mem"
	countName            = "nvidia.com/gpu-count"
	gpuCountKey          = "nvidia.accelerator/nvidia_count"
	cardNameKey          = "nvidia.accelerator/nvidia_name"
	gpuMemKey            = "nvidia.accelerator/nvidia_mem"
	pluginComponentKey   = "component"
	pluginComponentValue = "gpushare-device-plugin"

	envNVGPUID        = "NVIDIA_COM_GPU_MEM_IDX"
	envPodGPUMemory   = "NVIDIA_COM_GPU_MEM_POD"
	envTOTALGPUMEMORY = "NVIDIA_COM_GPU_MEM_DEV"
)

func init() {
	kubeInit()
	// checkpointInit()
}

func main() {
	var nodeName string
	// nodeName := flag.String("nodeName", "", "nodeName")
	details := flag.Bool("d", false, "details")
	flag.Parse()

	args := flag.Args()
	if len(args) > 0 {
		nodeName = args[0]
	}

	var pods []v1.Pod
	var nodes []v1.Node
	var err error

	if nodeName == "" {
		nodes, err = getAllSharedGPUNode()
		if err == nil {
			pods, err = getActivePodsInAllNodes()
		}
	} else {
		nodes, err = getNodes(nodeName)
		if err == nil {
			pods, err = getActivePodsByNode(nodeName)
		}
	}

	if err != nil {
		fmt.Printf("Failed due to %v", err)
		os.Exit(1)
	}

	nodeInfos, err := buildAllNodeInfos(pods, nodes)
	if err != nil {
		fmt.Printf("Failed due to %v", err)
		os.Exit(1)
	}
	if *details {
		displayDetails(nodeInfos)
	} else {
		displaySummary(nodeInfos)
	}

}
