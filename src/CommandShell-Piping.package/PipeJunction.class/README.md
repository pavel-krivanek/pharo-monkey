I am a connector junction for input, output, and error pipelines. I obtain input from an input pipeline and, after possibly performing some kind of operation on the input objects, I send output to an output pipeline. I may also append objects onto an error pipeline.

My subclasses implement the operations on the objects which pass through a pipe junction.

In general, input pipes are connected to output pipes in a serial fashion, and error pipelines are shared by one or more instances of my subclasses.
