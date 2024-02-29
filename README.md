# CNCF Webinar: Enabling WebAssembly workloads in Kubernetes

WebAssembly is a lightweight and portable bytecode format that executes in a secure sanboxed runtime. Originally created for the browser, it has been adapted in recent years for server-side applications by taking advantage of the WASI specification. Kubernetes provides a rich ecosystem of tools and integrations that can be leveraged to manage, monitor, and scale applications. By embracing WebAssembly, developers can tap into the extensive Kubernetes ecosystem to create resource-efficient applications that scale effortlessly and fit seemlessly into existing environments.

## Requirements
- Kubernetes cluster
- kubectl
- helm
- spin
- rust & wasm32-wasi target
- golang & tinygo
- node & npm

## Projects we depend on
- [deislabs/containerd-wasm-shims](https://github.com/deislabs/containerd-wasm-shims) - containerd shim for Spin & other WebAssembly runtimes
- [Kwasm/kwasm-operator](https://github.com/kwasm/kwasm-operator) - Kubernetes operator that installs WebAssembly runtimes on Kubernetes
- [fermyon/spin](https://github.com/fermyon/spin) - Spin is the open source developer tool for building and running serverless applications powered by WebAssembly.
