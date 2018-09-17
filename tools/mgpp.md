The MG preprocessor (`mgpp.py`) is what is now used to generate inline data expressions from binary files inside event files.

This is meant to replace the old bat+bin2ea combination; Mostly to allow cleaner sources as now writing the source file is almost like writing the processed file.

# Example

Let the unprocessed file be as follows:

    DataList:
        $$DataList.dmp(s)

And the DataList.dmp file be this (hex):

    01 00 02 00 03 00 04 00

The processed file will look like this:

    DataList:
        SHORT $1 $2 $3 $4

# Explanation

Every processed expression are of the form `$$<filename>` or `$$<filename>(<option>)`:

- The `filename` is a relative path to the file from the folder the source file is located.
- The `option` is either `b`, `s`, `w` and defines whether to output `BYTE`, `SHORT` and `WORD` expressions. (When no option is given, it assumes `b`/`BYTE` by default)

# Dependency generation

The preprocessor can also generate makefile chunks defining file dependencies on the target file (the list of binary files referenced in the file). This is useful.
