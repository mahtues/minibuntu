# some additions to the default ubuntu's .bashrc

## bash\_completion files

```
for BCF in "~/.bash_completion.*" ; do
    if [ -f "$BCF" ] ; then
        . "$BCF"
    fi
done
```
