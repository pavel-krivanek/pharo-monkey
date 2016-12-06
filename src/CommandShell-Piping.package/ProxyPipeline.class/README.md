A collection of connected PipeJunctions, representing external OS processes or internal evaluators. This class exists primarily to make the functioning of a collection of command pipelines, some of which may be evaluated as asynchronous "background" processes, easier to understand.

Events triggered by my proxies are handled and forwarded in such a way that a client (such as a CommandShell) will receive events from a ProxyPipeline as if it were an individual PipeJunction.

The user of a ProxyPipeline is responsible for closing the external resources associated with the proxies by sending either #closePipes or #finalize.