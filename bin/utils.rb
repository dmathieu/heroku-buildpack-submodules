class Utils

  def self.with_stdlib(cmd)
    system <<EOF
if [[ ! -f  /tmp/stdlib.sh ]]; then
  curl --retry 3 -s https://lang-common.s3.amazonaws.com/buildpack-stdlib/v4/stdlib.sh > /tmp/stdlib.sh
fi
source /tmp/stdlib.sh
#{cmd}
EOF
  end
end
