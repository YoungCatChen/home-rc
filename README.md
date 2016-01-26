Home-RC
=======
**Quick and organised -- take both.**

The Home-RC project offers an great way to maintain the **dot files** you need everyday.
They include `.bashrc`, `.profile`, `.vimrc`, and many others.

The novelty in organization is for `.bashrc`, `.bash_profile` and `.profile`
which get executed once a terminal is initialized.

* A (normally giant) `.bashrc` file is broken down to many smaller files, each with one functionality.
* A cache file is executed instead. This speeds up `bash` (or `sh`) initialization in two ways:
  * The cache is a single file and there's no need to open every small file. Opening file may be expensive, especially on Cygwin.
  * The cache contains pre-computed values.
* It updates the cache file **after** shell initialization.


Example
-------

Let's take `alias ls='ls --color=auto'` as an example.
People may want to have `ls` to display things in color, and that's why this alias gets popular.

In a traditional way, people write code in `~/.bashrc`:
```
if command ls --color=auto / &>/dev/null; then
  alias ls='ls --color=auto'
fi
```

This snippet works perfectly well, but it takes time to execute an extra `ls` command.
Here is what we do in `updator/bashrc.d/90-ls.sh`:
```
if command ls --color=auto / &>/dev/null; then
  write_to_cache "alias ls='ls --color=auto'"
fi
```

Then the cache file located at `~/.cache/bashrc.HOSTNAME.local`
will include this alias iff `ls` supports `--color`.
The cache gets executed by the new `~/.bashrc`.
In this way, we have:

1. the functionality of conditional aliasing, <br>
2. cache's fast execution, as well as <br>
3. well-organised scripts.
