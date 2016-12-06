I am a first-in, first-out queue with streaming behavior. I behave similarly to an OSPipe,
but am implemented in the Smalltalk image rather than with external OS pipes. I can
behave either as a blocking pipe or as a nonblocking pipe, similar to an OS pipe with
its reader end set in blocking or nonblocking mode.