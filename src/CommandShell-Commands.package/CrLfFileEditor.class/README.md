I provide an editor on a single file. I attempt to avoid changing the line termination character convention when writing my text back to a file.

Bug: On older Squeak systems which do not support FilesStream>>truncate, file permissions may be lost when a file is rewritten at a shorter length.
