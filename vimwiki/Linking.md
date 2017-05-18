
## Symbolic Linker ##

If you create a symbolic link to a file/directory and then change it's location, 
instead of deleting and then creating a new link, the link can be updated as follows:
	
**Creation:**	`ln -s /path/to/file-name link-name`

**Update:**	`ln -sfn /path/to/file-name link-name`
	
