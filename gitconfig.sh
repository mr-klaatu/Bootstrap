[color]
	ui = true
[user]
	name = David Cheetham
	email = mr_klaatu.com
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
