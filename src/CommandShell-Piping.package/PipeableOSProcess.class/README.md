I am a connector junction for input, output, and error pipelines. I collaborate with a process proxy to evaluate an internal or external process, and to move objects through the pipelines as the proxy is evaluated.

From Smalltalk, you can write to my pipeToInput, and read from my pipeFromOutput and pipeFromError streams. I implement simple streaming protocol as a convenience for reading and writing these pipe streams. I support command pipelines with the #| message, with the pipeFromOutput of one instance connected to the pipeToInput of the next instance, and a shared errorPipelineStream collecting error output text for the command pipeline.

All reading and writing should be done with the streaming protocol, rather than by direct access to the pipe streams. This is because the output pipe streams may be silently replaced by simple ReadStreams following the exit of the child process.

Normal exit for the external process may not happen when expected. If the process is writing to the output pipe, it may block on write until enough of its data is read from the pipeFromOutput pipe, after which it will exit normally.