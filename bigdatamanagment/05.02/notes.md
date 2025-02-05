# Darbs ar github
## Pamata git komandas

svarīgi pievienot readme

License - svarīga daļa, nepieciesams pievienot publiskām repositorijām
> MIT License

Git ignore - var likt iekšā tikai kodu un dokumentāciju
**NEDRĪKST LIKT**
> sensatīvos datus
> datubāzi
> downloads
> secrets

### Pirmie soļi versijas kontroles inicializācijā

> Initialize git repository
`git init`

> Link local git repository with remote
`git remote add origin $(github url)`

> Upload your commits to remote repository
`git push origin main`

## Usefull comands

> Add all changes into git stage
`git add -A`
`git add .`

> save changes in git stage
`git commit -m "komentars"`

> Upload your commits to main
`git push origin main`

## izveidojam jaunu branch

> new brach
`git branch BRANCHNAME' `

> switch to new branch
`git checkout BRANCHNAME`

> combine together
`git checkout -b TESTBRANCH`

> merging brancehe
`git checkout main` #pārejam no test -> main
`git merge test` #apvienojam branchus

> pievienojam un izdzēšam branch
`git branch -d hotfix`

