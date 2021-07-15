# Defined interactively
function diskuse
df -h | head -n 1
df -h | grep "/dev/sda2"
df -h | grep "/dev/sda1"
end
