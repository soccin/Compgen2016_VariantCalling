# Look at the Trii Unix Course Notes

# Most Commonly Used Commands

--|--|--|--|--|--
**fgrep**| 10.81%|**cd**|10.11%|**ls**|8.06%
**more**|7.77%|**cat**|6.39%|**rm**|3.53%
*find*|3.23%|xargs|2.69%|cut|2.67%
egrep|2.41%|mkdir|1.86%|sort|1.76%
git|1.66%|awk|1.66%|wc|1.58%
*head*|1.32%|*mv*|1.26%|bjobs|1.23%
sed|1.22%|*uniq*|1.19%|history|1.00%
vi|0.97%|*pwd*|0.90%|cp|0.90%
tr|0.86%|perl|0.77%|du|0.75%
samtools|0.68%|listCols|0.56%|zcat|0.56%
hg|0.54%|parseLSFLogs.py|0.49%|tee|0.48%
chmod|0.45%|rsync|0.43%|*ln*|0.43%
sudo|0.43%|diff|0.42%|bedtools|0.38%

# Things to cover

## Home directory:

```bash
# Go home
cd
```

```bash
# Show home direcotry
cd
pwd

# better (leaves you in where you are)

echo $HOME
```

## Important intermediate commands

### `man`

- make sure to go over `man`

    - `man -k` == `apropos`

### `history`

- list and rerun commands

- `!!` usually replaced by up-arrow

- history editting replaced with cut-and-paste

### `locate`

- make sure to explain caveat that database is **not** updated continuously (usually everyday)

- typically configure to not index user space

    - **NOT** like spotlight

- Mostly useful for system stuff

- works best with `grep`

### `fgrep`, `egrep`, `grep`

- `fgrep` == fast grep (`grep -F`)
- `egrep` == extended grep (`grep -E`)

From man page:

> Direct invocation as either `egrep` or `fgrep` is deprecated,
> but  is  provided  to allow historical applications that
> rely on them to run unmodified.

i.e., for old people

## Unix cautions

- `mv` semantics can be deceptive

```
mv file1 file2
```

This renames `file1` to file `file2` but if `file2` exists it also deletes `file2`

- many people uses alias to redefine defaults to something more forgiving.

For beginners strongly suggest

```
alias mv="mv -n"
```

Probably should also do `alias rm="rm -i"`, but gets tedious pretty quickly

