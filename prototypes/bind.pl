#!/usr/bin/perl -n
BEGIN {$prev = "NULL"}
if (m{// : (.*?) \( (.*?) \)}) {
	print "\
void $2_code FTH_REGS;
static struct primitive $2_def = {
	.link = {
		.prev = (struct link *)$prev,
		.name = \"$1\",
		.namelen = sizeof(\"$1\"),
	},
	.xt = {(void *)$2_code},
};";
	$prev = "&$2_def.link";
}