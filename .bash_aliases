
# save()
# {
# 	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
# 	for i in ~/*;do rsync -auv $i $1/ ;done
# }

# bck()
# {
# 	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
# 	for i in $1/*;do rsync -auv $i ~/ ;done
# }

