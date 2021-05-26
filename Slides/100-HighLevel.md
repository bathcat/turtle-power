# High Level

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Reasons I Like Pwsh

---

### Cross-Platform


---

### .NET-Based


---

### Powerful


```pwsh

function fix-slidebreaks($path){
  (Get-Content $path -Raw) -replace '(?ms)\s^(?=#{1,3}\s)', "---`n`n" | Out-File $path
}

Get-Item ./src/content/ | Get-ChildItem -Recurse -Filter content.mdx | %{fix-slidebreaks $_}

```

---

### Ergonomic
* Verb-noun makes it easy to read
  + Unlike dir, cat, set, grep
* Help system 
* Tab-completion
* Windows terminal / VSCode

--- 

### Useful

```pwsh

npm run ssr
cd dist
# By default, gihub pages ignores folders prefixed with underscores.
echo '' >> .nojekyll

# This is so the custom domain setting won't get clobbered
echo 'bathcat.net' >> CNAME

git init
git add -A
git commit -m 'deploy'

git push -f https://github.com/bathcat/bathcat.github.io +master
```

